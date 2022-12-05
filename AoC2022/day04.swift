//
//  day04.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

enum Day04 {
    static func run() {
        let input1 = readFile("day04.input")
        let result = day04Part1(input1)
        print(result)
        print(day04Part2(input1))
    }
}

func day04Part1(_ input: String) -> Int {
    let lines = input.lines
    var sum = 0
    for line in lines {
        let components = line.components(separatedBy: .punctuationCharacters)
        let range1 = Int(components[0])!...Int(components[1])!
        let range2 = Int(components[2])!...Int(components[3])!
        if range1.contains(range2) || range2.contains(range1) {
            sum += 1
        }
    }
    return sum
}

func day04Part2(_ input: String) -> Int {    
    let lines = input.lines
    var sum = 0
    for line in lines {
        let components = line.components(separatedBy: .punctuationCharacters)
        let range1 = Int(components[0])!...Int(components[1])!
        let range2 = Int(components[2])!...Int(components[3])!
        if range1.overlaps(range2) || range2.overlaps(range1) {
            sum += 1
        }
    }
    return sum
}
