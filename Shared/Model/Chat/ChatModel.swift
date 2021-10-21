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
    
    
    init() {}
    
    init(id: String, name: String, detail: String) {
        self.id = id
        self.name = name
        self.detail = detail
    }
    
    
    func fetch(ids: [String]) -> [ChatModel] {
        guard let url = Bundle.main.url(forResource: "Chat", withExtension: "json") else {
                fatalError("Couldn't find file in main bundle.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't load filename from main bundle")
            }
            
            do {
                let model: [ChatModel] = try JSONDecoder().decode([ChatModel].self, from: data)
                var returnModel = [ChatModel]()
                ids.forEach { id in
                    for model in model where id == model.id {
                        returnModel.append(model)
                    }
                }
                return returnModel
            }
            catch {
                fatalError("Couldn't parse file as \(ChatModel.self):\n\(error)")
            }
        }
    
    
}
