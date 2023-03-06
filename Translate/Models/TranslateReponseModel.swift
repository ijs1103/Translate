//
//  TranslateReponseModel.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import Foundation

struct TranslateReponseModel: Decodable {
    private let message: Message

    var translatedText: String { message.result.translatedText }

    struct Message: Decodable {
        let result: Result
    }

    struct Result: Decodable {
        let translatedText: String
    }
}
