//
//  SideMenuRow.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/14.
//

import Foundation
import SwiftUI


struct SideMenuRow: View {
    let topPadding: CGFloat
    let systemName: String
    let text: String
    let width: CGFloat

    init(topPadding: CGFloat = 20, systemName: String, text: String, width: CGFloat = 270) {
        self.topPadding = topPadding
        self.systemName = systemName
        self.text = text
        self.width = width
    }

    var body: some View {
        HStack {
            Button(action: {
                print("TAP \(text)")
            }) {
                Image(systemName: systemName)
                    .foregroundColor(.gray)
                    .imageScale(.large)
                    .frame(width: 32.0)
                Text(text)
                    .foregroundColor(.gray)
                    .font(.headline)
                Spacer()
            }
            
        }
        .padding(.top, topPadding)
        .padding(.leading, 32)
        .frame(width: self.width)
    }
}

