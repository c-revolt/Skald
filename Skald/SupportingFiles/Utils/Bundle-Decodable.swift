//
//  Bundle-Decodable.swift
//  Skald
//
//  Created by Александр Прайд on 23.12.2022.
//

import UIKit

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        // проверяем наличие файла по указанному пути
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("❓Failed to locate \(file) in bundle.")
        }
        
        // проверяем наличие информации в файле
        guard let data = try? Data(contentsOf: url) else {
            fatalError("⭕️ Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        // конвертируем информацию из файла в модель данных, в объект типа T
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("❌ Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
