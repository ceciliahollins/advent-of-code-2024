
struct ClawMachine {
    // The position of the buttons represents the movement of the claw when pressed. It can be positive or negative to represent different movements
    var buttonA: Position = Position(0, 0)
    var buttonB: Position = Position(0, 0)
    
    // The position of the prize is where in the matrix the prize sits
    var prize: Position = Position(0, 0)
}

struct Position: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

