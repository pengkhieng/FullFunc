//
//  Enums.swift
//  FullFunc
//
//  Created by PENGKHIENG-KIM on 18/4/25.
//

import Foundation

enum AppIcon: String, CaseIterable, Identifiable {
    case `default` = "AppIcon"
    case icon1 = "AppIcon 1"
    case icon2 = "AppIcon 2"
    case icon3 = "AppIcon 3"
    case icon4 = "AppIcon 4"
    case icon5 = "AppIcon 5"
    case icon6 = "AppIcon 6"
    case icon7 = "AppIcon 7"
    case icon8 = "AppIcon 8"
    
    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .default: return "AppIcon"
        case .icon1: return "AppIcon 1"
        case .icon2: return "AppIcon 2"
        case .icon3: return "AppIcon 3"
        case .icon4: return "AppIcon 4"
        case .icon5: return "AppIcon 5"
        case .icon6: return "AppIcon 6"
        case .icon7: return "AppIcon 7"
        case .icon8: return "AppIcon 8"
        }
    }

    var iconName: String? {
        self == .default ? nil : self.rawValue
    }
}
