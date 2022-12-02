//
//  day02.swift
//  AoC2022
//
//  Created by Marcel Mravec on 01.12.2022.
//
// A X  Rock - Rock 4
// A Y Rock - Paper 8
// A Z Rock - Scissors 3
// B X Paper - Rock 1
// B Y Paper - Paper 5
// B Z Paper - Scissors 9
// C X Scissors - Rock 7
// C Y Scissors - Paper 2
// C Z Scissors - Scissors 6

import Foundation



enum Day02 {
    static func run() {
        let input1 = readFile("day02.input")
        
        
        let result = day02Part1(input1)
        print(result)
        
        print(day02Part2(input1))
    }
    
}

func day02Part1(_ input: String) -> Int {
    let roundOne = [
        "A X": 4, "A Y": 8, "A Z": 3, "B X": 1, "B Y": 5, "B Z": 9, "C X": 7, "C Y": 2, "C Z": 6
    ]
    let lines = input.lines
    var sum = 0
    for line in lines {
        sum += roundOne[line] ?? 0
    }
    return sum
}

func day02Part2(_ input: String) -> Int {
    let roundTwo = [
        "A X": 3, "A Y": 4, "A Z": 8, "B X": 1, "B Y": 5, "B Z": 9, "C X": 2, "C Y": 6, "C Z": 7
    ]
    let lines = input.lines
    var sum = 0
    for line in lines {
        sum += roundTwo[line] ?? 0
    }
    return sum
}
