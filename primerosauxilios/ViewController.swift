//
//  ViewController.swift
//  primerosauxilios
//
//  Created by Arath Saavedra Cabrera on 01/10/26.
//

import UIKit

/// Home screen: searchable list of first-aid topics grouped by category.
class ViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let searchController = UISearchController(searchResultsController: nil)
    private let cellIdentifier = "TopicCell"

    private var sections: [(category: FirstAidCategory, topics: [FirstAidTopic])] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Primeros Auxilios"
        view.backgroundColor = .systemGroupedBackground

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar: quemadura, RCP, asfixia…"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.preferredSearchBarPlacement = .stacked
        if #available(iOS 26.0, *) {
            navigationItem.searchBarPlacementAllowsToolbarIntegration = false
        }
        navigationItem.backButtonDisplayMode = .minimal

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = makeDisclaimerFooter()
        EmergencyCallBar.install(in: self, above: tableView)

        applyFilter("")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeFooterToFit()
    }

    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        if sections.isEmpty {
            var config = UIContentUnavailableConfiguration.search()
            config.text = "Sin resultados"
            config.secondaryText = "Prueba con otra palabra. Si es una emergencia, llama al \(EmergencyCaller.number)."
            contentUnavailableConfiguration = config
        } else {
            contentUnavailableConfiguration = nil
        }
    }

    private func applyFilter(_ query: String) {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        let topics = trimmed.isEmpty ? FirstAidLibrary.topics : FirstAidLibrary.topics.filter { $0.matches(trimmed) }
        sections = FirstAidCategory.allCases.compactMap { category in
            let items = topics.filter { $0.category == category }
            return items.isEmpty ? nil : (category, items)
        }
        tableView.reloadData()
        tableView.tableFooterView?.isHidden = sections.isEmpty
        setNeedsUpdateContentUnavailableConfiguration()
    }

    private func makeDisclaimerFooter() -> UIView {
        let label = UILabel()
        label.text = FirstAidLibrary.disclaimer
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView()
        container.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: container.layoutMarginsGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: container.layoutMarginsGuide.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -24),
        ])
        return container
    }

    private func sizeFooterToFit() {
        guard let footer = tableView.tableFooterView else { return }
        let width = tableView.bounds.width
        let size = footer.systemLayoutSizeFitting(
            CGSize(width: width, height: UIView.layoutFittingCompressedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        if footer.frame.size != CGSize(width: width, height: size.height) {
            footer.frame.size = CGSize(width: width, height: size.height)
            tableView.tableFooterView = footer
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].topics.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].category.title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topic = sections[indexPath.section].topics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: topic.symbolName)
        content.imageProperties.tintColor = topic.tint
        content.imageProperties.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title2)
        content.imageProperties.reservedLayoutSize = CGSize(width: 36, height: 36)
        content.text = topic.title
        content.textProperties.font = .preferredFont(forTextStyle: .headline)
        content.secondaryText = topic.summary
        content.secondaryTextProperties.color = .secondaryLabel
        content.secondaryTextProperties.numberOfLines = 0
        content.textToSecondaryTextVerticalPadding = 4
        content.directionalLayoutMargins.top = 12
        content.directionalLayoutMargins.bottom = 12
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let topic = sections[indexPath.section].topics[indexPath.row]
        navigationController?.pushViewController(TopicDetailViewController(topic: topic), animated: true)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        applyFilter(searchController.searchBar.text ?? "")
    }
}
