//
//  Bundle+Decode.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import Foundation

extension Bundle {
    /// Decode file JSON dari bundle (bisa di subfolder, mis. Resources/mock_meals/)
    func decode<T: Decodable>(_ name: String,
                              ext: String = "json",
                              in subdirectory: String? = nil) -> T {
        let url: URL? =
            self.url(forResource: name, withExtension: ext, subdirectory: subdirectory)
            ?? self.url(forResource: name, withExtension: ext)

        guard let url else {
            fatalError("❌ File \(name).\(ext) tidak ditemukan (subdir: \(subdirectory ?? "-"))")
        }
        let data: Data
        do { data = try Data(contentsOf: url) }
        catch { fatalError("❌ Gagal load \(name).\(ext): \(error)") }

        do { return try JSONDecoder().decode(T.self, from: data) }
        catch { fatalError("❌ Gagal decode \(name).\(ext): \(error)") }
    }
}
