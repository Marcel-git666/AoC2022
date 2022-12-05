//
//  day05.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

enum Day05 {
    static func run() {
        let input = readFile("day05.input")
        let parts = input.components(separatedBy: "\n\n")
        print(parts[0])
        print("--------")
        let lines = parts[0].split(separator: "\n")
        print(lines)
        
        print("--------")
        print(parts[1])
        print(day05Part1(parts))
        print(day05Part2(parts))
    }
}

func day05Part1(_ input: [String]) -> Int {
    
//    var startingState: Array<[Character]> = [
//       ["Z", "N"],
//       ["M", "C", "D"],
//       ["P"]
//    ]
    

    
    var startingState: Array<[Character]> = [
       ["F", "C", "J", "P", "H", "T", "W"],
       ["G", "R", "V", "F", "Z", "J", "B", "H"],
       ["H", "P", "T", "R"],
       ["Z", "S", "N", "P", "H", "T"],
       ["N", "V", "F", "Z", "H", "J", "C", "D"],
       ["P", "M", "G", "F", "W", "D", "Z"],
       ["M", "V", "Z", "W", "S", "J", "D", "P"],
       ["N", "D", "S"],
       ["D", "Z", "S", "F", "M"]
    ]
    
    
//    let crateLines = input[0].split(separator: "\n")
//    print(crateLines)
//    let max  = crateLines.last!.count
    
    print(startingState)
    print("Trimming")
    var moves: [[Int]] = []
    let instructions = input[1].split(separator: "\n")
    print(instructions)
    for (index, instruction) in instructions.enumerated() {
        let result = instruction.split(separator: " ")
        let ints = result.compactMap { Int($0) }
        print(ints)
        moves.append(ints)
        let slice = startingState[ints[1]-1].suffix(ints[0]).reversed()
        print("Slice: \(slice) přidávám do \(ints[2]-1) a odebírám ve stacku \(ints[1]-1)")
        startingState[ints[2]-1].append(contentsOf: slice)
        startingState[ints[1]-1].removeLast(ints[0])
        print(startingState)
    }
    
    print("Moves: \(moves)")
//    print(stackOne, stackTwo, stackThree)
    var result = ""
    for (index, item) in startingState.enumerated() {
        result += String(startingState[index].last!)
    }
    print(result)
    return 0
}

func day05Part2(_ input: [String]) -> Int {
//    var startingState: Array<[Character]> = [
//       ["Z", "N"],
//       ["M", "C", "D"],
//       ["P"]
//    ]
    

    
    var startingState: Array<[Character]> = [
       ["F", "C", "J", "P", "H", "T", "W"],
       ["G", "R", "V", "F", "Z", "J", "B", "H"],
       ["H", "P", "T", "R"],
       ["Z", "S", "N", "P", "H", "T"],
       ["N", "V", "F", "Z", "H", "J", "C", "D"],
       ["P", "M", "G", "F", "W", "D", "Z"],
       ["M", "V", "Z", "W", "S", "J", "D", "P"],
       ["N", "D", "S"],
       ["D", "Z", "S", "F", "M"]
    ]
    
    
//    let crateLines = input[0].split(separator: "\n")
//    print(crateLines)
//    let max  = crateLines.last!.count
    
    print(startingState)
    print("Trimming")
    var moves: [[Int]] = []
    let instructions = input[1].split(separator: "\n")
    print(instructions)
    for (index, instruction) in instructions.enumerated() {
        let result = instruction.split(separator: " ")
        let ints = result.compactMap { Int($0) }
        print(ints)
        moves.append(ints)
        let slice = startingState[ints[1]-1].suffix(ints[0])
        print("Slice: \(slice) přidávám do \(ints[2]-1) a odebírám ve stacku \(ints[1]-1)")
        startingState[ints[2]-1].append(contentsOf: slice)
        startingState[ints[1]-1].removeLast(ints[0])
        print(startingState)
    }
    
    print("Moves: \(moves)")
//    print(stackOne, stackTwo, stackThree)
    var result = ""
    for (index, item) in startingState.enumerated() {
        result += String(startingState[index].last!)
    }
    print(result)
    return 0
}
