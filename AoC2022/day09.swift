//
//  day09.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

enum Day09 {
    static func run() {
        let input = readFile("day09.test")
        let lines = input.lines
        print(lines)
    
        print(day09Part1(lines))
        print(day09Part2(lines))
    }
    
}

func day09Part1(_ lines: [String]) -> Int {
    
    var sum = 0
    var tailVisited: [String] = []
    var headX = 0
    var headY = 0
    var tailX = 0
    var tailY = 0
//    let flattened = directions.flatMap { $0 }
    print(lines.count)
    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
    for line in lines {
//        print(tailVisited)
//        print("Head: \(headX):\(headY), tail: \(tailX):\(tailY)")
        let instructionLetter = line.first!
        let instructionNumber = Int(line.suffix(line.count-2))!
//        print("Letter is: \(instructionLetter) key: \(instructionNumber)")
        
        switch instructionLetter {
        case "R":
            for _ in 0..<instructionNumber {
                headX += 1
                if abs(headX-tailX) > 1 {
                    tailX = headX - 1
                    if headY != tailY {
                        tailY = headY
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "L":
            for _ in 0..<instructionNumber {
                headX -= 1
                if abs(headX-tailX) > 1 {
                    tailX = headX + 1
                    if headY != tailY {
                        tailY = headY
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "U":
            for _ in 0..<instructionNumber {
                headY += 1
                if abs(headY-tailY) > 1 {
                    tailY = headY - 1
                    if headX != tailX {
                        tailX = headX
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "D":
            for _ in 0..<instructionNumber {
                headY -= 1
                if abs(headY-tailY) > 1 {
                    tailY = headY + 1
                    if headX != tailX {
                        tailX = headX
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        default: print("Unknown letter")
        }
        
        
    }
    print("Head: \(headX):\(headY), tail: \(tailX):\(tailY)")
    print(tailVisited)
    sum = Set(tailVisited).count
    return sum
    
}

func day09Part2(_ lines: [String]) -> Int {
    
    
    var sum = 0
    var tailVisited: [String] = []
    var ropesX = Array(repeating: 0, count: 10)
    var ropesY = Array(repeating: 0, count: 10)
    
//    let flattened = directions.flatMap { $0 }
    print(lines.count)
    tailVisited.append(String(format: "%05d:%05d", ropesX[9], ropesY[9]))
    for line in lines {
//        print(tailVisited)
//        print("Head: \(headX):\(headY), tail: \(tailX):\(tailY)")
        let instructionLetter = line.first!
        let instructionNumber = Int(line.suffix(line.count-2))!
//        print("Letter is: \(instructionLetter) key: \(instructionNumber)")
        
        switch instructionLetter {
        case "R":
            for _ in 0..<instructionNumber {
                ropesX[0] += 1
                if abs(headX-tailX) > 1 {
                    tailX = headX - 1
                    if headY != tailY {
                        tailY = headY
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "L":
            for _ in 0..<instructionNumber {
                headX -= 1
                if abs(headX-tailX) > 1 {
                    tailX = headX + 1
                    if headY != tailY {
                        tailY = headY
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "U":
            for _ in 0..<instructionNumber {
                headY += 1
                if abs(headY-tailY) > 1 {
                    tailY = headY - 1
                    if headX != tailX {
                        tailX = headX
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        case "D":
            for _ in 0..<instructionNumber {
                headY -= 1
                if abs(headY-tailY) > 1 {
                    tailY = headY + 1
                    if headX != tailX {
                        tailX = headX
                    }
                    tailVisited.append(String(format: "%05d:%05d", tailX, tailY))
                }
                
            }
        default: print("Unknown letter")
        }
        
        
    }
    print("Head: \(headX):\(headY), tail: \(tailX):\(tailY)")
    print(tailVisited)
    sum = Set(tailVisited).count
    
    return sum
}
