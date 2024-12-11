import Foundation

public func diskFragmenter(_ input: String) -> Int {
    
    var diskMap = input.inputToDiskMap()
    // diskMap.printBlocks() // uncomment to print the blocks at the beginning of the problem
    
    var checksum = 0
    
    // A string used for debugging the final line
    var debugLine = ""
    
    var currPos = 0
    var i = 0
    while i < diskMap.blocks.count {
        let block = diskMap.blocks[i]
        
        switch block.type {
            
        case .free:
            
            // Get the block at the end of the list
            // If it is space, ignore it
            // If it is files, move up however much will fit and calculate checksum
            // Repeat this until the space is full
            var availSpace = block.space
            while availSpace > 0 {
                let lastBlock = diskMap.blocks.last!
                
                switch lastBlock.type {
                    
                case .free:
                    // If the last block is free space, remove it from the list, it does not matter
                    diskMap.blocks.removeLast()
                    
                case .file(let id):
                    // If the last block has more space than what is available
                    if lastBlock.space > availSpace {
                        // Subtract all the available space from the last block
                        diskMap.blocks[diskMap.blocks.count - 1].space -= availSpace
                        // Calculate the checksum for what is moved up
                        let finishPos = currPos + availSpace
                        while currPos < finishPos {
                            debugLine.append("\(id)")
                            checksum += currPos * id
                            currPos += 1
                        }
                        
                        availSpace = 0
                        
                    // There is enough space for the entire last block
                    } else {
                        
                        // Move the whole last block up and remove it
                        let finishPos = currPos + lastBlock.space
                        while currPos < finishPos {
                            debugLine.append("\(id)")
                            checksum += currPos * id
                            currPos += 1
                        }
                        diskMap.blocks.removeLast()
                        availSpace -= lastBlock.space
                    }
                }
            }
            
        case .file(let id):
            
            // Add these positions to the checksum
            let finishPos = currPos + block.space
            while currPos < finishPos {
                debugLine.append("\(id)")
                checksum += currPos * id
                currPos += 1
            }
        }
        
        i += 1
    }
    
    //print(debugLine) // uncomment to print the final line
    return checksum
}

public func diskFragmenterPartTwo(_ input: String) -> Int {
    
    var diskMap = input.inputToDiskMap()
    // diskMap.printBlocks() // uncomment to print the blocks at the beginning of the problem
    
    // Instead of doing a solution similar to part 1 we bascially have to rejig our solution for the new constraint
    // Part 1 was good because it was O(n) solution, where as this one is closer to O(n^2) + O(n)
    // Surely this can be improved to operate more similar to part 1
    
    // Possible improvement: Currently, this solution is starting at the end and searching for a potential spot to add to, then at the end calculating the checksum which adds another O(n) time. Instead, start at the beginning and find potential additions for the empty spaces. This way the checksum can be calculated as we go rather than at the end. The only issue with this is files need to be moved from right to left in order. If this approach is taken, it may create spaces that aren't ready to be created based on the right to left moves first rules, because it will take whatever fits at the time.
    
    // Start at the end of the disk map
    var i = diskMap.blocks.count - 1
    // iterate until at the start
    while i > 0 {
        
        let block = diskMap.blocks[i]
        
        switch block.type {
            
        // If the block type is free, it does not need to be moved
        case .free:
            i -= 1
            
        // If the block type is a file, there is a possibility for movement
        case .file:
            
            // Check all the possible blocks to move to
            possibilities: for possibleIndex in 0..<i {
                let possibleBlock = diskMap.blocks[possibleIndex]
                switch possibleBlock.type {
                    
                // If the possible block type is free, the current block could maybe move here
                case .free:
                    
                    // Check there is enough space for the block to fit
                    if block.space <= possibleBlock.space {
                        
                        // Update the current block to be free
                        diskMap.blocks[i].type = .free
                        
                        // Remove the block at the possible index
                        diskMap.blocks.remove(at: possibleIndex)
                        
                        // Check if there is leftover space
                        let leftoverSpace = possibleBlock.space - block.space
                        if leftoverSpace > 0 {
                            // If leftover space, add the rest of the space back into the map
                            diskMap.blocks.insert(DiskBlock(type: .free, space: leftoverSpace), at: possibleIndex)
                            // increase i right, because we added an extra index
                            i += 1
                        }
                        // insert the curren block into its new moved spot
                        diskMap.blocks.insert(block, at: possibleIndex)
                        
                        // Break the loop, the block has been moved
                        break possibilities
                    }
                  
                // If a file is here, the block cannot be moved here as it is already occupied
                case .file:
                    continue
                }
            }
            
            // Move left in the list of blocks
            i -= 1
        }
    }
    
    
    // Calculate the checksum
    // Similar to calculation in part 1
    var checksum = 0
    var currPos = 0
    var debugLine = ""
    for block in diskMap.blocks {
        // Add these positions to the checksum
        let finishPos = currPos + block.space
        while currPos < finishPos {
            switch block.type {
            case .free:
                debugLine.append(".")
            case .file(let id):
                debugLine.append("\(id)")
                checksum += currPos * id
            }
            currPos += 1
        }
    }
    
    //print(debugLine) // uncomment to print the final line
    return checksum
}
