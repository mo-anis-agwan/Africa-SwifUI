//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Anis on 30/04/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>( _ file: String) -> T {
        // Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // Create a property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // Create a decoder
        let decoder = JSONDecoder()
        // Create a property for decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // return ready-to-use data
        return decodedData
    }
}
