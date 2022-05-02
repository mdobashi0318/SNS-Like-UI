//
//  ProfileModel.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/15.
//

import Foundation

class ProfileModel: Codable {
    
    var id: String = ""
    var name: String = ""
    var bio: String = ""
    var chat: [ChatModel] = []
    var follow: [String] = []
    
    
    func fetch() -> ProfileModel {
        let prof = ResourceUtils<ProfileModel>.loadJson(forResource: "Profile")
        prof.follow.append(prof.id)
        prof.chat = ChatModel().fetch(ids: prof.follow)
        return prof
    }
    
}
