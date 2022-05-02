//
//  ResourceUtils.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2022/05/02.
//

import Foundation

struct ResourceUtils<T> {}

extension ResourceUtils where T: Codable {
    
    /// Jsonファイルを読み込む
    static func loadJson(forResource: String) -> T {
        guard let url = Bundle.main.url(forResource: forResource, withExtension: "json") else {
                fatalError("Couldn't find file in main bundle.")
            }

            guard let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't load filename from main bundle")
            }

            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                return json
            }
            catch {
                fatalError("Couldn't parse file as \(T.self):\n\(error)")
            }
        }
    
}
