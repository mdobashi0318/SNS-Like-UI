//
//  SideMenuView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/14.
//

import Foundation
import SwiftUI

struct SideMenuView: View {
    
    @Binding var isOpen: Bool
    
    /// スワイプ等で変化したサイドメニューの長さ
    @State var width: CGFloat
    
    @ObservedObject var viewModel: ProfileViewModel
    
    /// サイドメニューの長さの定数
    let sideWidth: CGFloat = 270
    
    var body: some View {
        ZStack {
            HStack {
                VStack() {
                    NavigationLink(destination: {
                        ProfileView(model: viewModel.model)
                            .onAppear {
                                isOpen = false
                            }
                    }){
                        SideMenuRow(topPadding: 125, systemName: "person", text: "Profile")
                    }
                    NavigationLink(destination: {
                        Text("SidePage3")
                            .onAppear {
                                isOpen = false
                            }
                    }){
                        SideMenuRow(systemName: "gear", text: "Setting")
                    }
                    NavigationLink(destination: {
                        VStack(alignment: .center) {
                            Text("ログアウトしてアプリを終了しますか？")
                            Button(action: {
                                UserDefaults.standard.setBool(key: .auth, value: false)
                                exit(0)
                            }) {
                                Text("ログアウト")
                                    .frame(width: 150, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(50 / 2)
                            }
                        }
                    }){
                        SideMenuRow(systemName: "power", text: "ログアウト")
                    }
                    Spacer()
                }
                .frame(width: self.width)
                .background(Color(UIColor.systemGray6))
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeIn(duration: 0.25))
                Spacer()
            }
            .gesture(
                DragGesture().onChanged { value in
                    width = value.location.x
                }.onEnded { value in
                    if value.location.x < value.startLocation.x {
                        /// つぎサイドメニュー表示したときに長さが縮んでる時があるので閉じる前に定数の長さを入れる
                        width = self.sideWidth
                        isOpen.toggle()
                    }
                })
        }
    }
}

