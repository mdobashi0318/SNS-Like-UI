//
//  ChatModel.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/20.
//

import Foundation
class ChatModel: Codable {
    
    var id: String = ""
    var name: String = ""
    var detail: String = ""
    var like: Bool = false
    
    
    init() {}
    
    init(id: String, name: String, detail: String, like: Bool) {
        self.id = id
        self.name = name
        self.detail = detail
        self.like = like
    }
    
    
    func fetch(ids: [String]) -> [ChatModel] {
        let model = ResourceUtils<[ChatModel]>.loadJson(forResource: "Chat")
        var returnModel = [ChatModel]()
        ids.forEach { id in
            for model in model where id == model.id {
                returnModel.append(model)
            }
        }
        return returnModel
    }
}
