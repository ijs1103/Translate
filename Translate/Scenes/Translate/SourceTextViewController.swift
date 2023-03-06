//
//  SourceTextViewController.swift
//  Translate
//
//  Created by 이주상 on 2023/03/06.
//

import SnapKit
import UIKit

protocol SourceTextViewControllerDelegate: AnyObject {
    func didEnterText(_ sourceText: String)
}

final class SourceTextViewController: UIViewController {
    private let placeholderText = NSLocalizedString("Enter_text", comment: "텍스트 입력")

    private weak var delegate: SourceTextViewControllerDelegate?

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = placeholderText
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 18.0, weight: .semibold)
        textView.returnKeyType = .done
        textView.delegate = self

        return textView
    }()
    // init에서 delegate 주입
    init(delegate: SourceTextViewControllerDelegate?) {
        self.delegate = delegate

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16.0)
        }
    }
}

extension SourceTextViewController: UITextViewDelegate {
    // 입력이 시작될 때, placeholder를 지우고 text색 변경
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }

        textView.text = nil
        textView.textColor = .label
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 엔터를 눌렀을때
        guard text == "\n" else { return true }
        // 입력한 텍스트를 이전화면에 전달
        delegate?.didEnterText(textView.text)
        // 창을 종료
        dismiss(animated: true)

        return true
    }
}
