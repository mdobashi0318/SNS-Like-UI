//
//  View+.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/10.
//

import Foundation
import SwiftUI

extension View {
    
    var height: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    var width: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
}
