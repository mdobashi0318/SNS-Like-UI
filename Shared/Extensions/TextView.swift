//
//  TextView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/24.
//

import Foundation
import SwiftUI


///https://qiita.com/abouch/items/8fa4c8e7777fd4ed37db
struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = .systemGray6
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
    }
}

extension TextView {
    final class Coordinator: NSObject, UITextViewDelegate {
        private var textView: TextView

        init(_ textView: TextView) {
            self.textView = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.textView.text = textView.text
        }
    }
}
