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
        guard let url = Bundle.main.url(forResource: "Profile", withExtension: "json") else {
                fatalError("Couldn't find file in main bundle.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't load filename from main bundle")
            }
            
            do {
                let prof = try JSONDecoder().decode(ProfileModel.self, from: data)
                prof.follow.append(prof.id)
                prof.chat = ChatModel().fetch(ids: prof.follow)
                return prof
            }
            catch {
                fatalError("Couldn't parse file as \(ProfileModel.self):\n\(error)")
            }
        }
    
    
}
