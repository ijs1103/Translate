//
//  BookmarkCollectionViewCell.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import SnapKit
import UIKit

final class BookmarkCollectionViewCell: UICollectionViewCell {
    static let identifier = "BookmarkCollectionViewCell"

    private var sourceBookmarkTextStackView: BookmarkTextStackView!
    private var targetBookmarkTextStackView: BookmarkTextStackView!

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0

        stackView.layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        // stackView에 layoutmargin을 허용하는 설정, 디폴트값 false이고 false이면 layoutMargins를 지정해도 실제로는 적용이 안됨.
        stackView.isLayoutMarginsRelativeArrangement = true

        return stackView
    }()

    func setup(from bookmark: Bookmark) {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12.0

        sourceBookmarkTextStackView = BookmarkTextStackView(
            language: bookmark.sourceLanguage,
            text: bookmark.sourceText,
            type: .source
        )

        targetBookmarkTextStackView = BookmarkTextStackView(
            language: bookmark.translatedLanguage,
            text: bookmark.translatedText,
            type: .target
        )
        // 스택뷰의 서브뷰들을 초기화, 스택뷰 초기화시 에러를 방지
        stackView.subviews.forEach { $0.removeFromSuperview() }

        [sourceBookmarkTextStackView, targetBookmarkTextStackView]
            .forEach { stackView.addArrangedSubview($0) }

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32.0)
        }
    }
}
