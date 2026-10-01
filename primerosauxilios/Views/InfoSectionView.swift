//
//  InfoSectionView.swift
//  primerosauxilios
//

import UIKit

/// A rounded card with a titled list of items, either numbered or marked with a symbol.
final class InfoSectionView: UIView {
    enum Marker {
        case numbered
        case symbol(String)
    }

    init(title: String, symbolName: String, tint: UIColor, items: [String], marker: Marker) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemGroupedBackground
        layer.cornerRadius = 16
        layer.cornerCurve = .continuous

        let header = UILabel()
        header.font = UIFont.preferredBoldFont(forTextStyle: .title3)
        header.adjustsFontForContentSizeCategory = true
        header.numberOfLines = 0
        header.text = title
        header.accessibilityTraits = .header

        let headerIcon = UIImageView(image: UIImage(systemName: symbolName))
        headerIcon.tintColor = tint
        headerIcon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title3, scale: .medium)
        headerIcon.setContentHuggingPriority(.required, for: .horizontal)
        headerIcon.isAccessibilityElement = false

        let headerStack = UIStackView(arrangedSubviews: [headerIcon, header])
        headerStack.spacing = 8
        headerStack.alignment = .center

        let stack = UIStackView(arrangedSubviews: [headerStack])
        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false

        for (index, item) in items.enumerated() {
            stack.addArrangedSubview(Self.makeRow(text: item, index: index, marker: marker, tint: tint))
        }

        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private static func makeRow(text: String, index: Int, marker: Marker, tint: UIColor) -> UIView {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = text

        let markerView: UIView
        switch marker {
        case .numbered:
            let number = CircleLabel()
            number.text = "\(index + 1)"
            number.font = UIFont.preferredBoldFont(forTextStyle: .subheadline)
            number.adjustsFontForContentSizeCategory = true
            number.textColor = .white
            number.textAlignment = .center
            number.backgroundColor = tint
            number.setContentHuggingPriority(.required, for: .horizontal)
            number.setContentCompressionResistancePriority(.required, for: .horizontal)
            markerView = number
        case .symbol(let name):
            let icon = UIImageView(image: UIImage(systemName: name))
            icon.tintColor = tint
            icon.contentMode = .scaleAspectFit
            icon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .body)
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.widthAnchor.constraint(equalToConstant: 28).isActive = true
            markerView = icon
        }

        let row = UIStackView(arrangedSubviews: [markerView, label])
        row.spacing = 12
        row.alignment = .firstBaseline
        if case .numbered = marker {
            row.alignment = .top
        }
        row.isAccessibilityElement = true
        if case .numbered = marker {
            row.accessibilityLabel = "Paso \(index + 1). \(text)"
        } else {
            row.accessibilityLabel = text
        }
        return row
    }
}

/// Label drawn inside a circle that grows with its text (e.g. with Dynamic Type).
private final class CircleLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        let textSize = super.intrinsicContentSize
        let side = max(28, max(textSize.width, textSize.height) + 8)
        return CGSize(width: side, height: side)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
