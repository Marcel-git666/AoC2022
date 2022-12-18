//
//  day07.swift
//  AoC2022
//
//  Created by Marcel Mravec on 04.12.2022.
//

import Foundation

final class Directory {
    var name: String
    var files: [String: Int]
    var subdirectories: [Directory] = []
    weak var parent: Directory?
    
    init(name: String, files: [String: Int]) {
        self.name = name
        self.files = files
    }
    
    func add(subdirectory: Directory) {
        subdirectories.append(subdirectory)
        subdirectory.parent = self
      }
    
    
    var size: Int {
        files.values.reduce(0, +) + subdirectories.reduce(0) { $0 + $1.size }
    }
}

extension Directory: CustomStringConvertible {
  var description: String {
    var text = "\(name): "
      for file in files {
          text += "\(file.key) - \(file.value) B "
      }
    if !subdirectories.isEmpty {
      text += " {" + subdirectories.map { $0.description }.joined(separator: ", ") + "} "
    }
    return text
  }
    

}

extension Directory {

  func search(name: String) -> Directory? {
    if name == self.name {
      return self
    }
    for subdirectory in subdirectories {
      if let found = subdirectory.search(name: name) {
        return found
      }
    }
    return nil
  }
}


enum Day07 {
    static func run() {
        let input = readFile("day07.test")
        let lines = input.lines
        var tree: Directory
        var subdir: Directory
        tree = Directory(name: "/", files: [:])
        subdir = tree.search(name: "/")!
        
        for line in lines {
            switch line.prefix(4) {
            case "$ cd":
                if String(line.split(separator: " ").last!) == ".." {
                    subdir = subdir.parent!
                } else {
                    let temp = String(line.split(separator: " ").last!)
                    print(temp)
                    subdir = subdir.search(name: temp)!
                }
            case "$ ls": print("listing ....")
            default: let components = line.split(separator: " ")
                switch components[0] {
                case "dir": subdir.add(subdirectory: Directory(name: String(components[1]), files: [:]))
                default: subdir.files[String(components[1])] = Int(components[0]) ?? 0
                }
            }
            print("\(line) dá výstup \(tree)")
        }
        print("File structure:")
        print(tree)
        print(tree.size)
        subdir = tree.search(name: "/")!
        
        for subdirectory in subdir.subdirectories {
            let size = subdirectory.size
            if ( size > 100000) {
                print("Tisknu velké: \(subdirectory)")
                print(subdirectory.size)
            } else {
                print("Tisknu malé: \(subdirectory)")
                print(subdirectory.size)
            }
        }
        
    }
    
}

func day07Part1(_ input: [String.Element]) -> Int {
    
    var sum = 0
    
    
    
    return sum
}

func day07Part2(_ input: [String]) -> Int {
    
    
    var sum = 0
    
    return sum
}
