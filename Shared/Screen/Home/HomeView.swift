//
//  HomeView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/09.
//

import Foundation
import SwiftUI

struct HomeView: View {
        
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        List {
            ForEach(0..<viewModel.model.chat.count, id: \.self) { row in
                NavigationLink(destination: {
                    DetailView(model: viewModel.model.chat[row])
                }) {
                    HomeListRow(model: viewModel.model.chat[row])
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ProfileViewModel())
    }
}
