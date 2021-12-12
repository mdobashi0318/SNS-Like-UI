//
//  LoginTopView.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/10/28.
//

import Foundation
import SwiftUI

struct LoginTopView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: {
                    PWLoginView()
                }) {
                    Text("ログイン")
                }
                .padding(.bottom)
            }
        }
    }
    
}


struct LoginTopView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTopView()
    }
}
