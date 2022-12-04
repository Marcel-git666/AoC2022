//
//  util.swift
//  AoC2021
//
//  Created by Marcel Mravec on 17.12.2021.
//

import Foundation

func readFile(_ name:String) ->  String {
    let projectURL = URL(fileURLWithPath: #file).deletingLastPathComponent()
    let fileURL = projectURL.appendingPathComponent(name)
    let data = try! Data(contentsOf: fileURL)
    return String(data: data, encoding: .utf8)!
}


extension String {
    var lines: [String] {
    split(separator: "\n").map { $0.trimmingCharacters(in: .whitespaces) }
    }
}

extension Int {
    init?(_ s: Substring) {
        guard let int = Int(String(s)) else { return nil }
            self = int
    
    }
}

extension String {
    func components(withLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}

extension Range {
    func contains(otherRange: Range) -> Bool {
        contains(otherRange.lowerBound) && contains(otherRange.upperBound)
    }
}
