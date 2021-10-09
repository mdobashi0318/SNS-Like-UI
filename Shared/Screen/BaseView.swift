//
//  BasetView.swift
//  Shared
//
//  Created by 土橋正晴 on 2021/10/09.
//

import SwiftUI

struct BasetView: View {
    var body: some View {
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
}

struct BasetView_Previews: PreviewProvider {
    static var previews: some View {
        BasetView()
    }
}
