
// A hashable struct for the stone information to be used in a dictionary
struct Stone: Hashable {
    var numOfStones: Int
    var blinks: Int
    
    init(s numOfStones: Int, b blinks: Int) {
        self.numOfStones = numOfStones
        self.blinks = blinks
    }
}

