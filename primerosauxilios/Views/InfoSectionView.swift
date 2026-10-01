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
        header.font = UIFont.preferredFont(forTextStyle: .title3).bold()
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
            let number = UILabel()
            number.text = "\(index + 1)"
            number.font = UIFont.preferredFont(forTextStyle: .subheadline).bold()
            number.adjustsFontForContentSizeCategory = true
            number.textColor = .white
            number.textAlignment = .center
            number.backgroundColor = tint
            number.layer.cornerRadius = 14
            number.layer.masksToBounds = true
            number.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                number.widthAnchor.constraint(equalToConstant: 28),
                number.heightAnchor.constraint(equalToConstant: 28),
            ])
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
