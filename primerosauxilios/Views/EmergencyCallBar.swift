//
//  EmergencyCallBar.swift
//  primerosauxilios
//

import UIKit

final class EmergencyCallBar: UIView {
    var onCall: (() -> Void)?

    private let button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemRed
        config.baseForegroundColor = .white
        config.cornerStyle = .large
        config.image = UIImage(systemName: "phone.fill")
        config.imagePadding = 10
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { attributes in
            var attributes = attributes
            attributes.font = UIFont.preferredBoldFont(forTextStyle: .title3)
            return attributes
        }
        config.title = "Llamar al \(EmergencyCaller.number)"
        let button = UIButton(configuration: config)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.accessibilityLabel = "Llamar a emergencias, \(EmergencyCaller.number)"
        button.accessibilityHint = "Inicia una llamada telefónica a los servicios de emergencia"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        let separator = UIView()
        separator.backgroundColor = .separator
        separator.translatesAutoresizingMaskIntoConstraints = false

        addSubview(separator)
        addSubview(button)
        button.addAction(UIAction { [weak self] _ in self?.onCall?() }, for: .primaryActionTriggered)
        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (self: Self, _) in
            self.button.setNeedsUpdateConfiguration()
        }

        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: topAnchor),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),

            button.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func install(in viewController: UIViewController, above scrollView: UIScrollView) {
        let bar = EmergencyCallBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.onCall = { [weak viewController] in
            guard let viewController else { return }
            EmergencyCaller.call(from: viewController)
        }
        let view = viewController.view!
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        view.addSubview(bar)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bar.topAnchor),

            bar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension UIFont {
    /// Bold variant of a text style that keeps scaling with Dynamic Type.
    static func preferredBoldFont(forTextStyle style: TextStyle) -> UIFont {
        let base = UIFont.preferredFont(forTextStyle: style, compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        let bold = base.fontDescriptor.withSymbolicTraits(.traitBold).map { UIFont(descriptor: $0, size: 0) } ?? base
        return UIFontMetrics(forTextStyle: style).scaledFont(for: bold)
    }
}
