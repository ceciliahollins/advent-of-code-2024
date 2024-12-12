import Foundation

public func plutonianPebbles(_ input: [Int], blinks: Int) -> Int {
    
    // Place the input into an edittable variable
    var stones = input
    
    // Execute the number of required blinks
    var currBlink = 1
    while currBlink <= blinks {
        
        // Iterate the stone
        // Use a while loop since stones might be added and the array will be updated
        var i = 0
        while i < stones.count {
            
            // Follow the rules
            
            // If the stone is engraved with the number 0, it is replaced by a stone engraved with the number 1
            if stones[i] == 0 {
                stones[i] = 1
                
            // If the stone is engraved with a number that has an even number of digits, it is replaced by two stones. The left half of the digits are engraved on the new left stone, and the right half of the digits are engraved on the new right stone. (The new numbers don't keep extra leading zeroes: 1000 would become stones 10 and 0.)
            } else if String(stones[i]).count.isMultiple(of: 2) {
                
                let newStones = splitStone(stones[i])
                stones.remove(at: i)
                stones.insert(newStones.1, at: i)
                stones.insert(newStones.0, at: i)
                i += 1
                
            // If none of the other rules apply, the stone is replaced by a new stone; the old stone's number multiplied by 2024 is engraved on the new stone
            } else {
                stones[i] *= 2024
            }
            
            i += 1
        }
        
        currBlink += 1
    }
    
    return stones.count
}


// Time to get smarter!!
// 75 blinks takes way too long to just iterate the stones and follow the rules, I should have seen this coming :)
public func plutonianPebblesPartTwo(_ input: [Int], blinks: Int) -> Int {
    
    // Patterns that create overlapping subproblems:
    // * 1 will always become 2024
    // * 0 will always become 1
    // * Figure out what 2024 makes and save lots of time
    
    // Instead of iterating the array every time, start with one number and figure out how many stones that one stone position will produce
    // That way we can find overlapping subproblems and quit early
    // https://www.hackingwithswift.com/plus/high-performance-apps/using-memoization-to-speed-up-slow-functions
    
    
    // A memo variable that holds a stone number and how many stones it will end up producing
    var memo: [Stone: Int] = [:]
    // A recursive function to calculate how many stones will be produced
    var dfsStones: ((Int, Int) -> Int)!
    dfsStones = { stone, blinks in
        
        // Base case: all the blinks are done
        if blinks == 0 {
            return 1
        }
        
        // Check the memo
        if let memoResult = memo[Stone(s: stone, b: blinks)] {
            return memoResult
        }
        
        var stoneResult = 0
        
        if stone == 0 {
            stoneResult += dfsStones(1, blinks - 1)
        } else if String(stone).count.isMultiple(of: 2) {
            let newStones = splitStone(stone)
            stoneResult += dfsStones(newStones.0, blinks - 1)
            stoneResult += dfsStones(newStones.1, blinks - 1)
        } else {
            stoneResult += dfsStones(stone * 2024, blinks - 1)
        }
        
        memo[Stone(s: stone, b: blinks)] = stoneResult
        return stoneResult
    }
    
    var result = 0
    for stone in input {
        result += dfsStones(stone, blinks)
    }
    
    return result
}

// A helper function to split a stone
func splitStone(_ stone: Int) -> (Int, Int) {
    // Get the mid index
    let str = String(stone)
    let midIndex = str.index(str.startIndex, offsetBy: str.count / 2)
    
    // Get the left and right half from the mid index
    var leftHalf = str[str.startIndex..<midIndex]
    var rightHalf = str[midIndex..<str.endIndex]
    
    // Clean the zeros, but keep one zero if it is needed
    while leftHalf.count > 1,
        leftHalf.first == "0" {
        leftHalf.removeFirst()
    }
    while rightHalf.count > 1,
          rightHalf.first! == "0" {
        rightHalf.removeFirst()
    }
    
    // Convert back to Ints and add to the stone list
    // Make sure to skip these stones with the index variable
    if let leftInt = Int(leftHalf),
       let rightInt = Int(rightHalf) {
        return (leftInt, rightInt)
    }
    
    return (0,0)
}
