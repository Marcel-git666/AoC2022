//
//  day06.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

import Foundation

enum Day06 {
    static func run() {
        let input = readFile("day06.input")
        print(input.count)
        for (ind, _) in input.enumerated() {
            if ind > input.count - 13 {
                return
            }
            let startIndex = input.index(input.startIndex, offsetBy: ind)
            let endIndex = input.index(input.startIndex, offsetBy: ind+13)
            
            if String(input[startIndex...endIndex]).count == Set(String(input[startIndex...endIndex])).count {
                print(ind+14)
                return
            }
        }
        
    }
    
}

func day06Part1(_ input: [String.Element]) -> Int {
    
    var sum = 0
    
    
    
    return sum
}

func day06Part2(_ input: [String]) -> Int {
    
    
    var sum = 0
    
    return sum
}
