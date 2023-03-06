//
//  Type.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import UIKit

enum `Type` {
    case source
    case target

    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
