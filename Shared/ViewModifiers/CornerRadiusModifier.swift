//
//  CornerRadiusModifier.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2022/03/14.
//

import SwiftUI

struct CornerRadiusModifier: ViewModifier {
    
    var backgroundColor: Color
    
    var width: CGFloat
    
    var height: CGFloat
    
    var cornerRadius: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(height / cornerRadius)
    }
    
}


struct CornerRadiusModifier_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "plus")
            .modifier(CornerRadiusModifier(backgroundColor: Color.blue, width: 50, height: 50))
    }
}
