//
//  TopicDetailViewController.swift
//  primerosauxilios
//

import UIKit

/// Step-by-step instructions for a single first-aid topic.
final class TopicDetailViewController: UIViewController {

    private let topic: FirstAidTopic
    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    init(topic: FirstAidTopic) {
        self.topic = topic
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = topic.title
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemGroupedBackground

        EmergencyCallBar.install(in: self, above: scrollView)
        scrollView.alwaysBounceVertical = true

        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStack)

        let content = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: content.topAnchor, constant: 16),
            contentStack.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -24),
            contentStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            content.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])

        buildContent()
    }

    private func buildContent() {
        contentStack.addArrangedSubview(makeHeader())

        if topic.isLifeThreatening {
            contentStack.addArrangedSubview(makeUrgentBanner())
        }

        contentStack.addArrangedSubview(InfoSectionView(
            title: "Qué hacer",
            symbolName: "checklist",
            tint: topic.tint,
            items: topic.steps,
            marker: .numbered
        ))

        if !topic.tips.isEmpty {
            contentStack.addArrangedSubview(InfoSectionView(
                title: "Ten en cuenta",
                symbolName: "lightbulb.fill",
                tint: .systemYellow,
                items: topic.tips,
                marker: .symbol("info.circle.fill")
            ))
        }

        if !topic.donts.isEmpty {
            contentStack.addArrangedSubview(InfoSectionView(
                title: "Qué NO hacer",
                symbolName: "hand.raised.fill",
                tint: .systemRed,
                items: topic.donts,
                marker: .symbol("xmark.circle.fill")
            ))
        }

        if !topic.callWhen.isEmpty {
            contentStack.addArrangedSubview(InfoSectionView(
                title: "Llama al \(EmergencyCaller.number) si…",
                symbolName: "phone.fill",
                tint: .systemRed,
                items: topic.callWhen,
                marker: .symbol("exclamationmark.triangle.fill")
            ))
        }

        let disclaimer = UILabel()
        disclaimer.text = FirstAidLibrary.disclaimer
        disclaimer.font = .preferredFont(forTextStyle: .footnote)
        disclaimer.adjustsFontForContentSizeCategory = true
        disclaimer.textColor = .secondaryLabel
        disclaimer.numberOfLines = 0
        disclaimer.textAlignment = .center
        contentStack.addArrangedSubview(disclaimer)
    }

    private func makeHeader() -> UIView {
        let iconBackground = UIView()
        iconBackground.backgroundColor = topic.tint.withAlphaComponent(0.15)
        iconBackground.layer.cornerRadius = 18
        iconBackground.layer.cornerCurve = .continuous
        iconBackground.translatesAutoresizingMaskIntoConstraints = false

        let icon = UIImageView(image: UIImage(systemName: topic.symbolName))
        icon.tintColor = topic.tint
        icon.contentMode = .scaleAspectFit
        icon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        icon.translatesAutoresizingMaskIntoConstraints = false
        iconBackground.addSubview(icon)

        NSLayoutConstraint.activate([
            iconBackground.widthAnchor.constraint(equalToConstant: 64),
            iconBackground.heightAnchor.constraint(equalToConstant: 64),
            icon.centerXAnchor.constraint(equalTo: iconBackground.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: iconBackground.centerYAnchor),
        ])

        let title = UILabel()
        title.text = topic.title
        title.font = UIFont.preferredBoldFont(forTextStyle: .title1)
        title.adjustsFontForContentSizeCategory = true
        title.numberOfLines = 0
        title.accessibilityTraits = .header

        let summary = UILabel()
        summary.text = topic.summary
        summary.font = .preferredFont(forTextStyle: .body)
        summary.adjustsFontForContentSizeCategory = true
        summary.textColor = .secondaryLabel
        summary.numberOfLines = 0

        let textStack = UIStackView(arrangedSubviews: [title, summary])
        textStack.axis = .vertical
        textStack.spacing = 4

        let header = UIStackView(arrangedSubviews: [iconBackground, textStack])
        header.spacing = 16
        header.alignment = .center
        return header
    }

    private func makeUrgentBanner() -> UIView {
        let icon = UIImageView(image: UIImage(systemName: "exclamationmark.triangle.fill"))
        icon.tintColor = .white
        icon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .headline)
        icon.setContentHuggingPriority(.required, for: .horizontal)

        let label = UILabel()
        label.text = "Emergencia que pone en riesgo la vida. Llama al \(EmergencyCaller.number) o pide a alguien que llame mientras ayudas."
        label.font = UIFont.preferredBoldFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [icon, label])
        stack.spacing = 12
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        let banner = UIView()
        banner.backgroundColor = .systemRed
        banner.layer.cornerRadius = 16
        banner.layer.cornerCurve = .continuous
        banner.addSubview(stack)
        banner.isAccessibilityElement = true
        banner.accessibilityLabel = label.text
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: banner.topAnchor, constant: 14),
            stack.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: banner.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -14),
        ])
        return banner
    }
}
