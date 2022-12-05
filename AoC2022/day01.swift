//
//  day01.swift
//  AoC2022
//
//  Created by Marcel Mravec on 01.12.2022.
//

import Foundation

enum Day01 {
    static func run() {
        let input1 = readFile("day01.input")
        
        let result = day01Part1(input1)
        print(result)
        print(day01Part2(input1))
    }
}

func day01Part1(_ input: String) -> Int {
    var elves: [Int] = []
    var numberOfElves = 0
    var temp = 0
    let text = input.split(separator: "\n", omittingEmptySubsequences: false)
//    print(text)
    for item in text {
        if item == "" {
            elves.append(temp)
            numberOfElves += 1
            temp = 0
        } else {
            temp += Int(item)!
        }
    }
    let maximum = elves.max()!
    return maximum
}

func day01Part2(_ input: String) -> Int {
    var elves: [Int] = []
    var numberOfElves = 0
    var temp = 0
    let text = input.split(separator: "\n", omittingEmptySubsequences: false)
//    print(text)
    for item in text {
        if item == "" {
            elves.append(temp)
            numberOfElves += 1
            temp = 0
        } else {
            temp += Int(item)!
        }
    }
    var sorted = elves.sorted()
    sorted = sorted.reversed()
    return sorted[0]+sorted[1]+sorted[2]
}
