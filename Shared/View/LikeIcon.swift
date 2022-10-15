//
//  LikeIcon.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2022/10/16.
//

import SwiftUI

struct LikeIcon: View {
    
    @State var like: Bool
    
    var body: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(like ? .pink : .gray)
            .onTapGesture {
                like.toggle()
            }
            .animation(.default)
    }
    
}

struct LikeIcon_Previews: PreviewProvider {
    static var previews: some View {
        LikeIcon(like: false)
    }
}
