//
//  Bookmark.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language

    let sourceText: String
    let translatedText: String
}
