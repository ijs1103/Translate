//
//  TranslateRequestModel.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
