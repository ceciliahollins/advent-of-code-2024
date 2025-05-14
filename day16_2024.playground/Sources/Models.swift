struct Maze {
    let map: [[Character]]
    let startPos: Pos
    let endPos: Pos
}

struct Memo: Hashable {
    let pos: Pos
    let dir: Dir
    
    init(_ pos: Pos, _ dir: Dir) {
        self.pos = pos
        self.dir = dir
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

enum Dir: CaseIterable {
    case up
    case right
    case down
    case left
    
    var possibleDirs: [Dir] {
        switch self {
        case .up:
            [.up, .left, .right]
        case .right:
            [.right, .up, .down]
        case .down:
            [.down, .left, .right]
        case .left:
            [.left, .up, .down]
        }
    }
}

