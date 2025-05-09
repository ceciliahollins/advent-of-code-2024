struct Warehouse {
    var robot: Pos
    var boxes: Set<Pos>
    let walls: Set<Pos>
    let moves: [Dir]
    
    // A debug function to print the warehouse
    // Update the size of the array to the input size manually, I couldn't be bothered to make this dynamic
    func printWarehouse() {
        var arr: [[String]] = Array(repeating: Array(repeating: ".", count: 8), count: 8)
        
        guard arr[robot.y][robot.x] == "." else { fatalError("robot error") }
        arr[robot.y][robot.x] = "@"
        
        for wall in walls {
            guard arr[wall.y][wall.x] == "." else { fatalError("wall error") }
            arr[wall.y][wall.x] = "#"
        }
        
        for box in boxes {
            guard arr[box.y][box.x] == "." else { fatalError("box error") }
            arr[box.y][box.x] = "O"
        }
        
        for row in arr {
            var line = ""
            for char in row {
                line.append(char)
            }
            print(line)
        }
    }
}

struct WarehousePartTwo {
    var robot: Pos
    // Updated from part 1 to use a 2D array
    // It doesn't really help to use sets, I will know exactly which indices to look at so a 2D array is fine
    var map: [[Character]]
    let moves: [Dir]
    
    // A debug function to print the warehouse
    // Update the size of the array to the input size manually, I couldn't be bothered to make this dynamic
    func printWarehouse() {
        for row in map {
            var line = ""
            for char in row {
                line.append(char)
            }
            print(line)
        }
    }
}

struct Pos: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    func nextMove(_ dir: Dir) -> Pos {
        switch dir {
        case .up:
            Pos(x, y - 1)
        case .right:
            Pos(x + 1, y)
        case .down:
            Pos(x, y + 1)
        case .left:
            Pos(x - 1, y)
        }
    }
}

enum Dir: Character {
    case up = "^"
    case right = ">"
    case down = "v"
    case left = "<"
}

