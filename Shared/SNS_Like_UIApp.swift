//
//  SNS_Like_UIApp.swift
//  Shared
//
//  Created by 土橋正晴 on 2021/10/09.
//

import SwiftUI

@main
struct SNS_Like_UIApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.getBool(key: .auth) {
                BasetView()
            } else {
                LoginTopView()
            }
        }
    }
}
