import Foundation

public func ceresSearch(_ input: String) -> Int {
    
    // Convert the input into an array for easier lookup of values
    let wordSearch = input.inputToWordSearch()
    
    var foundWords = 0
    
    // Search the matrix
    for i in 0..<wordSearch.count {
        for j in 0..<wordSearch[i].count {
            
            // create the x and y directions to check
            let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
            
            // I know there is probably a better way to check as opposed to manually checking each letter with nested statements, but its a short enough input to check and it doesn't change, so might as well save effort and do it manually
            
            // Find an X
            let x = (i, j)
            if wordSearch[x.1][x.0] == "X" {
                // Pick a direction and begin to search
                for dir in directions {
                    
                    // Check if next letter is M, ensure we are not off the matrix
                    let m = (x.0 + dir.0, x.1 + dir.1)
                    guard m.0 >= 0, m.0 < wordSearch.count,
                            m.1 >= 0, m.1 < wordSearch.count else { continue }
                    if wordSearch[m.1][m.0] == "M" {
                        
                        // Check if next letter is A, ensure we are not off the matrix
                        let a = (m.0 + dir.0, m.1 + dir.1)
                        guard a.0 >= 0, a.0 < wordSearch.count,
                                a.1 >= 0, a.1 < wordSearch.count else { continue }
                        if wordSearch[a.1][a.0] == "A" {
                            
                            // Check if next letter is S, ensure we are not off the matrix
                            let s = (a.0 + dir.0, a.1 + dir.1)
                            guard s.0 >= 0, s.0 < wordSearch.count,
                                    s.1 >= 0, s.1 < wordSearch.count else { continue }
                            if wordSearch[s.1][s.0] == "S" {
                                foundWords += 1
                            }
                        }
                    }
                }
            }
        }
    }
    
    return foundWords
}

public func ceresSearchPartTwo(_ input: String) -> Int {
    
    // Convert the input into an array for easier lookup of values
    let wordSearch = input.inputToWordSearch()
    
    var foundX = 0
    
    // Search the matrix
    for i in 0..<wordSearch.count {
        for j in 0..<wordSearch[i].count {
            
            // create the x and y positions to check, but this time it's 4 positions to check at once
            // positions are in the array as: [first M, first S, second M, second S]
            let positions = [[(-1, -1), (1, 1), (-1, 1), (1, -1)],
                             [(-1, -1), (1, 1), (1, -1), (-1, 1)],
                             [(1, 1), (-1, -1), (-1, 1), (1, -1)],
                             [(1, 1), (-1, -1), (1, -1), (-1, 1)]]
            
            // Again, I know there is probably a better way to check as opposed to manually checking but this is saving lots of extra effort. Becuase of the weird requirement that it must be in an X shape, and because of the short and non-changing input, I will just check it manually
            
            let a = (i, j)
            if wordSearch[a.1][a.0] == "A" {
                for position in positions {
                    let m1 = (a.0 + position[0].0, a.1 + position[0].1)
                    let s1 = (a.0 + position[1].0, a.1 + position[1].1)
                    let m2 = (a.0 + position[2].0, a.1 + position[2].1)
                    let s2 = (a.0 + position[3].0, a.1 + position[3].1)
                    guard m1.0 >= 0, m1.0 < wordSearch.count,
                          m1.1 >= 0, m1.1 < wordSearch.count,
                          s1.0 >= 0, s1.0 < wordSearch.count,
                          s1.1 >= 0, s1.1 < wordSearch.count,
                          m2.0 >= 0, m2.0 < wordSearch.count,
                          m2.1 >= 0, m2.1 < wordSearch.count,
                          s2.0 >= 0, s2.0 < wordSearch.count,
                          s2.1 >= 0, s2.1 < wordSearch.count else { continue }
                    
                    if wordSearch[m1.1][m1.0] == "M",
                       wordSearch[s1.1][s1.0] == "S",
                       wordSearch[m2.1][m2.0] == "M",
                       wordSearch[s2.1][s2.0] == "S"{
                        foundX += 1
                    }
                }
            }
        }
    }
    
    return foundX
}
