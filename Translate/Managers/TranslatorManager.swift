//
//  TranslatorManager.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import Alamofire // AFNetworking, URLSession
import Foundation

struct TranslatorManager {
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en

    func translate(
        from text: String,
        completionHandler: @escaping (String) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else { return }

        let requestModel = TranslateRequestModel(
            source: sourceLanguage.languageCode,
            target: targetLanguage.languageCode,
            text: text
        )

        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "85EtEc9e1w49tTeUrdxy",
            "X-Naver-Client-Secret": "ZbnxYDRJCt"
        ]

        AF
            .request(url, method: .post, parameters: requestModel, headers: headers)
            .responseDecodable(of: TranslateReponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.translatedText)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
