
struct Pos: Equatable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

extension Pos {
    var left: Pos {
        return Pos(self.x - 1, self.y)
    }
    
    var right: Pos {
        return Pos(self.x + 1, self.y)
    }
    
    var up: Pos {
        return Pos(self.x, self.y - 1)
    }
    
    var down: Pos {
        return Pos(self.x, self.y + 1)
    }
    
    var upLeft: Pos {
        return Pos(self.x - 1, self.y - 1)
    }
    
    var upRight: Pos {
        return Pos(self.x + 1, self.y - 1)
    }
    
    var downLeft: Pos {
        return Pos(self.x - 1, self.y + 1)
    }
    
    var downRight: Pos {
        return Pos(self.x + 1, self.y + 1)
    }
}




