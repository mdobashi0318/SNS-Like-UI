//
//  BasetView.swift
//  Shared
//
//  Created by 土橋正晴 on 2021/10/09.
//

import SwiftUI

struct BasetView: View {
    
    @State var isOpenSideMenu = false
    
    @State var isShowModle = false
    
    var body: some View {
        NavigationView {
            ZStack {
                setTabView
                addButton
                SideMenuView(isOpen: $isOpenSideMenu, width: 270)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationBarItems(leading: Button(action: {
                self.isOpenSideMenu.toggle()
            }) {
                Image(systemName: "line.3.horizontal")
            })
        }
        .fullScreenCover(isPresented: $isShowModle) {
            InputChatView()
        }
    }
    
    
    private var setTabView: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("tab2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    
                }
            Text("tab3")
                .tabItem {
                    Image(systemName: "bell")
                }
            Text("tab4")
                .tabItem {
                    Image(systemName: "envelope")
                }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            isShowModle.toggle()
        }, label: {
            Image(systemName: "plus")
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(50 / 2)
        })
            .offset(x: UIScreen.main.bounds.width / 2.7, y: UIScreen.main.bounds.height / 3.5)
    }
}

struct BasetView_Previews: PreviewProvider {
    static var previews: some View {
        BasetView()
    }
}




