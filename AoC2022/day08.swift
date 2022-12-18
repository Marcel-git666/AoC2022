//
//  day08.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

enum Day08 {
    static func run() {
        let input = readFile("day08.input")
        print("Part 1:")
        print(day08Part1(input))
        print("Part 2:")
        print(day08Part2(input))
    }
    
}


func day08Part1(_ input: String) -> Int {
    
    var trees: [[Int]] = []
    var sum = 0
    var visibleTrees: [String] = []
    let lines = input.lines
    print(lines.count)
    
    
    for (index, line) in lines.enumerated() {
        trees.append([Int]())
        for (jIndex, jLine) in line.enumerated() {
            trees[index].append(jLine.wholeNumberValue ?? 0)
//            print("\(index) \(jIndex) \(line) \(jLine)")
        }
    }
    print(trees.count)
    var maxHeight = 0

    //search from left
    print("Zleva:")
    
    for row in 0..<trees.count {
        for col in 0..<trees.count {
            if ((row == 0) || (col == 0) || (row == trees.count - 1) || (col == trees.count - 1)) {
                visibleTrees.append(String(format: "%02d:%02d", row, col))
                
            }
            if col == 0 {
                maxHeight = trees[row][col]
            }
            if col > 0 && row > 0 && col < (trees.count - 1) && (row < trees.count - 1){
                if trees[row][col] > maxHeight {
                    visibleTrees.append(String(format: "%02d:%02d", row, col))
                    maxHeight = trees[row][col]
//                    print("Strom mimo okraj: řádek: \(row+1) sloupec: \(col+1) výška: \(trees[row][col])")
                    
                    
                }
            }
        }
    }
    
    sum = Set(visibleTrees).count
    print("Suma = \(sum)")
    //print(Set(visibleTrees).sorted())
    print("---------------------")

    print("Shora:")
    // shora
    for col in 0..<trees.count {
        for row in 0..<trees.count {
//            print("řádek \(row+1) sloupec \(col+1), výška: \(trees[row][col])")
            if ((row == 0) || (col == 0) || (row == trees.count - 1) || (col == trees.count - 1)) {
                visibleTrees.append(String(format: "%02d:%02d", row, col))
                
            }
            if row == 0 {
//                print("Setting max height for row \(col+1) na hodnotu: \(trees[row][col])")
                maxHeight = trees[row][col]
            }
            if col > 0 && row > 0 && col < (trees.count - 1) && (row < trees.count - 1) {
                
                
                if trees[row][col] > maxHeight {
                    visibleTrees.append(String(format: "%02d:%02d", row, col))
//                    print("Strom mimo okraj: řádek \(row+1) sloupec \(col+1), výška: \(trees[row][col])")
                    
                    maxHeight = trees[row][col]
                }
            }
        }
    }
    sum = Set(visibleTrees).count
    print("Suma = \(sum)")
    //print(Set(visibleTrees).sorted())
    print("---------------------")

    print("Zprava:")

    //search from right
    for row in 0..<trees.count {
        for col in stride(from: trees.count - 1, to: 0, by: -1) {
            if ((row == 0) || (col == 0) || (row == trees.count - 1) || (col == trees.count - 1)) {
                visibleTrees.append(String(format: "%02d:%02d", row, col))
                
            }
            if col == trees.count - 1 {
                maxHeight = trees[row][col]
            }
            if col > 0 && row > 0 && col < (trees.count - 1) && (row < trees.count - 1) {
                if trees[row][col] > maxHeight {
                    visibleTrees.append(String(format: "%02d:%02d", row, col))
                    maxHeight = trees[row][col]
//                    print("Strom při pohledu zprava mimo okraj: řádek: \(row+1) sloupec: \(col+1), výška: \(trees[row][col])")
                    
                    
                }
            }
        }
    }
    sum = Set(visibleTrees).count
    print("Suma = \(sum)")
    //print(Set(visibleTrees).sorted())
    print("---------------------")

    // zdola
    print("Zdola:")
    for col in 0..<trees.count {
        for row in stride(from: trees.count - 1, through: 0, by: -1) {
//            print("řádek \(row+1) sloupec \(col+1), výška: \(trees[row][col])")
            if ((row == 0) || (col == 0) || (row == trees.count - 1) || (col == trees.count - 1)) {
                visibleTrees.append(String(format: "%02d:%02d", row, col))
            
            }
            if row == trees.count - 1 {
//                print("Nastavuji max height z \(maxHeight) na \(trees[row][col])")
                maxHeight = trees[row][col]
            }
            if col > 0 && row > 0 && (col < trees.count - 1) && (row < trees.count - 1) {
                if trees[row][col] > maxHeight {
                    visibleTrees.append(String(format: "%02d:%02d", row, col))
//                    print("Strom mimo okraj: řádek: \(row+1) sloupec \(col+1), výška: \(trees[row][col])")
                    
                    maxHeight = trees[row][col]
                }
            }
        }
    }

//    print(Set(visibleTrees).sorted())
    sum = Set(visibleTrees).count
    print("Suma = \(sum)")
    return sum
}

func day08Part2(_ input: String) -> Int {
    var trees: [[Int]] = []
    var sum = 0
    var scenicScore: [Int] = []
    let lines = input.lines
    print(lines.count)
    
    
    for (index, line) in lines.enumerated() {
        trees.append([Int]())
        for (jIndex, jLine) in line.enumerated() {
            trees[index].append(jLine.wholeNumberValue ?? 0)
//            print("\(index) \(jIndex) \(line) \(jLine)")
        }
    }
    print(trees.count)
    
//    print(lookUp(x: 3, y: 2))
    for row in 0..<trees.count {
        for col in 0..<trees.count {
            let up = lookUp(x: row, y: col)
            let down = lookDown(x: row, y: col)
            let left = lookLeft(x: row, y: col)
            let right = lookRight(x: row, y: col)
            scenicScore.append(up*down*right*left)
//            print("XXX   row: \(row), col: \(col), up: \(up), down: \(down), right: \(right), left: \(left)")
        }
    }
    
    
    return scenicScore.max() ?? 0
    
    func lookUp(x: Int, y: Int) -> Int {
        var lookingDistance = 0
        if x == 0 {
            return lookingDistance
        }
        for col in stride(from: y, through: 0, by: -1) {
//            print("Col je \(col), y je \(y), řádek je \(x), hodnota stromu je \(trees[x][col])")
//            print("lookingDistance je \(lookingDistance)")
            
            if trees[x][col] < trees[x][y] {
                lookingDistance += 1
            } else if trees[x][col] == trees[x][y] && col != y {
                lookingDistance += 1
                return lookingDistance
            } else if trees[x][col] > trees[x][y] {
                lookingDistance += 1
                return lookingDistance
                
            }
            
//            print("Trees[x][col] je \(trees[x][col])....")
        }
        
//        print("souřadnice \(x) a \(y) mají hodnotu \(trees[x][y])")
        return lookingDistance
    }
    
    func lookDown(x: Int, y: Int) -> Int {
        var lookingDistance = 0
        
        if x == trees.count - 1 {
            return lookingDistance
        }
        
        for col in stride(from: y, to: trees.count, by: 1) {
            if trees[x][col] < trees[x][y] {
                lookingDistance += 1
            } else if trees[x][col] == trees[x][y] && col != y {
                lookingDistance += 1
                return lookingDistance
            } else if trees[x][col] > trees[x][y] {
                lookingDistance += 1
                return lookingDistance
            }
                
        }
        return lookingDistance
    }
    func lookRight(x: Int, y: Int) -> Int {
        var lookingDistance = 0
        if y == trees.count - 1 {
            return lookingDistance
        }
        
        for row in stride(from: x, to: trees.count, by: 1) {
            if trees[row][y] < trees[x][y] {
                lookingDistance += 1
            } else if trees[row][y] == trees[x][y] && row != x {
                lookingDistance += 1
                return lookingDistance
            } else if trees[row][y] > trees[x][y] {
                lookingDistance += 1
                return lookingDistance
            }
        }
        return lookingDistance
    }
    func lookLeft(x: Int, y: Int) -> Int {
        var lookingDistance = 0
        if y == 0 {
            return lookingDistance
        }
        for row in stride(from: x, through: 0, by: -1) {
            if trees[row][y] < trees[x][y] {
                lookingDistance += 1
            } else if trees[row][y] == trees[x][y] && row != x {
                lookingDistance += 1
                return lookingDistance
            } else if trees[row][y] > trees[x][y] {
                lookingDistance += 1
                return lookingDistance
            }
        }
        return lookingDistance
    }
}



