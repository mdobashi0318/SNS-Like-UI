//
//  HomeModel.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/10.
//

import Foundation


class HomeModel: Codable {
    
    var id: String = ""
    var name: String = ""
    var detail: String = ""
    
    init () {}
    
    init(id: String, name: String, detail: String) {
        self.id = id
        self.name = name
        self.detail = detail
    }
    
    
    func fetch() -> [HomeModel] {
        guard let url = Bundle.main.url(forResource: "Home", withExtension: "json") else {
                fatalError("Couldn't find file in main bundle.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't load filename from main bundle")
            }
            
            do {
                return try JSONDecoder().decode([HomeModel].self, from: data)
            }
            catch {
                fatalError("Couldn't parse file as \(HomeModel.self):\n\(error)")
            }
        }
    
}
