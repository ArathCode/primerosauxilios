//
//  FirstAidTopic.swift
//  primerosauxilios
//

import UIKit

enum FirstAidCategory: CaseIterable {
    case lifeThreatening
    case injuries
    case techniques

    var title: String {
        switch self {
        case .lifeThreatening: "Emergencias vitales"
        case .injuries: "Lesiones y otras situaciones"
        case .techniques: "Técnicas básicas"
        }
    }
}

struct FirstAidTopic: Hashable {
    let id: String
    let title: String
    let summary: String
    let symbolName: String
    let tint: UIColor
    let category: FirstAidCategory
    let keywords: [String]
    let steps: [String]
    var tips: [String] = []
    var donts: [String] = []
    var callWhen: [String] = []

    var isLifeThreatening: Bool { category == .lifeThreatening }

    func matches(_ query: String) -> Bool {
        let searchable = ([title, summary] + keywords).joined(separator: " ")
        return searchable.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
    }

    static func == (lhs: FirstAidTopic, rhs: FirstAidTopic) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
