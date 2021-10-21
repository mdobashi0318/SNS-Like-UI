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
                        Text("SidePage2")
                            .onAppear {
                                isOpen = false
                            }
                    }){
                        SideMenuRow(systemName: "bookmark", text: "Bookmark")
                    }
                    NavigationLink(destination: {
                        Text("SidePage3")
                            .onAppear {
                                isOpen = false
                            }
                    }){
                        SideMenuRow(systemName: "gear", text: "Setting")
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

