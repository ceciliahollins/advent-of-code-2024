struct Report {
    var levels: [Level] = []
}

struct Level {
    var level: [Int]
    var direction: Direction
    
    init(_ level: [Int]) {
        self.level = level
        self.direction = level[0] - level[1] < 0 ? .increasing : .decreasing
    }
}

enum Direction {
    case increasing
    case decreasing
}


