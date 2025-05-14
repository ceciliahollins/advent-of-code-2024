import Foundation

public func reindeerMaze(_ input: String) -> Int {
    
    let maze = input.inputToMaze()
    
    var lowestScoreForPath: ((Pos, Dir) -> Int)!
    var memo: [Memo: Int] = [:]
    lowestScoreForPath = { pos, dir in
        let map = maze.map
        
        // Base case: the position is the end position
        if pos == maze.endPos {
            print(pos, dir, "**returning**", 0)
            return 0
        }
        
        // Base case: this position and this direction has been check already
        if let m = memo[Memo(pos, dir)] {
            return m
        }
        memo[Memo(pos, dir)] = -1
        
        // Check a move in every direction
        // recursively call the closure to check for the score from that path
        var possiblePathScores: [Int] = []
        dirsLoop: for nextDir in dir.possibleDirs {
            if dir == nextDir {
                let nextPos = pos.nextMove(dir)
                if map[nextPos.y][nextPos.x] != "#" {
                    print("**curr**", pos, dir, "**next**", nextPos, nextDir)
                    let pathScore = lowestScoreForPath(nextPos, dir)
                    print("**result**", pos, dir, nextPos, nextDir, pathScore)
                    if pathScore != -1 {
                        possiblePathScores.append(pathScore + 1)
                        // Add this position and direction to the memo
                        memo[Memo(pos, dir)] = pathScore + 1
                    }
                }
            } else {
                print("**curr**", pos, dir, "**next**", pos, nextDir)
                let pathScore = lowestScoreForPath(pos, nextDir)
                print("**result**", pos, dir, pos, nextDir, pathScore)
                if pathScore != -1 {
                    possiblePathScores.append(pathScore + 1000)
                    // Add this position and direction to the memo
                    memo[Memo(pos, dir)] = pathScore + 1000
                }
            }
        }
        print(pos, dir, possiblePathScores)
        print(pos, dir, "**returning**", possiblePathScores.min() ?? -1)
        return possiblePathScores.min() ?? -1
    }
    
    
    return lowestScoreForPath(maze.startPos, .right)
}

//public func reindeerMaze(_ input: String) -> Int {
//    
//    let maze = input.inputToMaze()
//    
//    var lowestScoreForPath: ((Pos, Dir) -> Int)!
//    var memo: [Memo: Int] = [:]
//    lowestScoreForPath = { pos, dir in
//        let map = maze.map
//        
//        // Base case: the position is the end position
//        if pos == maze.endPos {
//            //print(pos, dir, "**returning**", 0)
//            return 0
//        }
//        
//        // Base case: this position and this direction has been check already
//        if let m = memo[Memo(pos, dir)] {
//            return m
//        }
//        memo[Memo(pos, dir)] = -1
//        
//        // Check a move in every direction
//        // recursively call the closure to check for the score from that path
//        var possiblePathScores: [Int] = []
//        dirsLoop: for nextDir in dir.possibleDirs {
//            let nextPos = pos.nextMove(nextDir)
//            
//            if map[nextPos.y][nextPos.x] != "#" {
//                //print("**curr**", pos, dir, "**next**", nextPos, nextDir)
//                let nextPathLowestScore = lowestScoreForPath(nextPos, nextDir)
//                //print("**result**", pos, dir, nextPathLowestScore)
//                guard nextPathLowestScore != -1 else { continue dirsLoop }
//                
//                let pathScore: Int
//                if dir == nextDir {
//                    pathScore = nextPathLowestScore + 1
//                } else {
//                    pathScore = nextPathLowestScore + 1001
//                }
//                possiblePathScores.append(pathScore)
//                // Add this position and direction to the memo
//                memo[Memo(pos, dir)] = pathScore
//            }
//        }
//        
//        //print(pos, dir, "**returning**", possiblePathScores.min() ?? -1)
//        return possiblePathScores.min() ?? -1
//    }
//    
//    
//    return lowestScoreForPath(maze.startPos, .right)
//}

public func reindeerMazePartTwo(_ input: String) -> Int {
    
   return 0
}
