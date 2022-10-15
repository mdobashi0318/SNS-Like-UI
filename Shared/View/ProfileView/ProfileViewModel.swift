//
//  ProfileViewModel.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var model: ProfileModel
    
    init() {
        model = ProfileModel().fetch()
    }
    
    
    func addChat(detail: String) -> Bool {
        if detail.isEmpty { return false }
        
        model.chat.append(ChatModel(id: model.id, name: model.name, detail: detail, like: false))
        objectWillChange.send()
        return true
    }
}
