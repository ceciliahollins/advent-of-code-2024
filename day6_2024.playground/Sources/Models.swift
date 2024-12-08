struct Map {
    var positions: [[MapPosition]] = []
    var guardPos: (x: Int, y: Int) = (0, 0)
    var guardDirection: Direction = .up
    
    mutating func move() -> (x: Int, y: Int) {
        var next = guardPos
        switch guardDirection {
        case .up:
            next.y -= 1
        case .down:
            next.y += 1
        case .left:
            next.x -= 1
        case .right:
            next.x += 1
        }
        return next
    }
}

enum MapPosition {
    case floor
    case object
}

enum Direction {
    case up
    case down
    case left
    case right
    
    var nextDirection: Direction {
        switch self {
        case .up:
            return .right
        case .down:
            return .left
        case .left:
            return .up
        case .right:
            return .down
        }
    }
}

// A hashable struct to put in the Set for tracking hit positions
struct Position: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

struct PositionTwo: Hashable {
    var x: Int
    var y: Int
    var dir: Direction
    
    init(_ x: Int, _ y: Int, _ dir: Direction) {
        self.x = x
        self.y = y
        self.dir = dir
    }
}




