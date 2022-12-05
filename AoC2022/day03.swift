//
//  day03.swift
//  AoC2022
//
//  Created by Marcel Mravec on 03.12.2022.
//

import Foundation

enum Day03 {
    static func run() {
        let input1 = readFile("day03.input")
        let result = day03Part1(input1)
        print(result)
        print(day03Part2(input1))
    }
}

func day03Part1(_ input: String) -> Int {
    let lines = input.lines
    var rucksackOne = Set<Character>()
    var rucksackTwo = Set<Character>()
    var sum = 0
    for line in lines {
        let components = line.components(withLength: line.count/2)
        rucksackOne = Set(components[0])
        rucksackTwo = Set(components[1])
        let intersection = rucksackOne.intersection(rucksackTwo)
        let arr = String(Array(intersection))
        if arr == arr.lowercased() {
            sum += Int((Character(arr).asciiValue! - Character("a").asciiValue!)) + 1
        } else {
            sum += Int((Character(arr).asciiValue! - Character("A").asciiValue!)) + 27
        }
    }
    return sum
}

func day03Part2(_ input: String) -> Int {
    let lines = input.lines
    var sum = 0
    var elfOne = Set<Character>()
    var elfTwo = Set<Character>()
    var elfThree = Set<Character>()
    for (index, line) in lines.enumerated() {
        if (index+1) % 3 == 2 {
            elfOne = Set(line)
        }
        if (index+1) % 3 == 1 {
            elfTwo = Set(line)
        }
        if (index+1) % 3 == 0 {
            elfThree = Set(line)
            let intersection = (elfOne.intersection(elfTwo)).intersection(elfThree)
            let arr = String(Array(intersection))
            if arr == arr.lowercased() {
                sum += Int((Character(arr).asciiValue! - Character("a").asciiValue!)) + 1
            } else {
                sum += Int((Character(arr).asciiValue! - Character("A").asciiValue!)) + 27
            }
        }
    }
    return sum
}
