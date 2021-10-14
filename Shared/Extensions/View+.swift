//
//  View+.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/10.
//

import Foundation
import SwiftUI

extension View {
    
    var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    var screenWidth: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
}
