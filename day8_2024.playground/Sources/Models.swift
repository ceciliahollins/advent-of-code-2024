
struct AntennaMap {
    let frequencies: [Character: [Pos]]
    let mapSize: (x: Int, y: Int)
    
    var antinodes: Set<Pos> = []
    
    // A helper function to check that the antinode is on the map
    func antinodeOnMap(_ pos: Pos) -> Bool {
        guard pos.x >= 0, pos.x <= mapSize.x,
              pos.y >= 0, pos.y <= mapSize.y else {
                  return false
              }
        return true
    }
    
    // A helper function that was used for debugging
    func drawMap() {
        var drawMap = Array(repeating: Array(repeating: ".", count: mapSize.x + 1), count: mapSize.y + 1)
        for a in antinodes {
            drawMap[a.y][a.x] = "#"
        }
        for freq in frequencies {
            for pos in freq.value {
                drawMap[pos.y][pos.x] = String(freq.key)
            }
        }
        
        for line in drawMap {
            var p = ""
            for char in line {
                p.append(char)
            }
            print(p)
        }
    }
}

// A hashable position struct to use in a set
struct Pos: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}




