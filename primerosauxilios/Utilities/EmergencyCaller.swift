//
//  EmergencyCaller.swift
//  primerosauxilios
//

import UIKit

enum EmergencyCaller {
    static let number = "911"

    static func call(from presenter: UIViewController) {
        guard let url = URL(string: "tel://\(number)") else { return }
        UIApplication.shared.open(url) { success in
            guard !success else { return }
            let alert = UIAlertController(
                title: "No se pudo iniciar la llamada",
                message: "Este dispositivo no puede hacer llamadas. Marca \(number) desde un teléfono lo antes posible.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Entendido", style: .default))
            presenter.present(alert, animated: true)
        }
    }
}
