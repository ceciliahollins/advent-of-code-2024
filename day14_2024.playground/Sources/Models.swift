struct Robot {
    let pos: GridPair
    let vel: GridPair
}

// A hashable struct to be used in dictionaries
struct GridPair: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
