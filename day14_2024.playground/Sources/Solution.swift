import Foundation

func restroomRedoubt(_ input: String, bathroom: GridPair) -> Int {
    
    let robots = input.inputToRobots()
    
    // Create an array to hold robots in a quadrant
    var result = Array(repeating: 0, count: 4)
    
    let xHalf = bathroom.x/2
    let yHalf = bathroom.y/2
    
    // Create the quadrant ranges
    let quadrant1 = (x: 0..<xHalf, y: 0..<yHalf)
    let quadrant2 = (x: xHalf+1..<bathroom.x, y: 0..<yHalf)
    let quadrant3 = (x: 0..<xHalf, y: yHalf+1..<bathroom.y)
    let quadrant4 = (x: xHalf+1..<bathroom.x, y: yHalf+1..<bathroom.y)
    let quadrants = [quadrant1, quadrant2, quadrant3, quadrant4]
    
    // Iterate the robots
    for robot in robots {
        
        // The final positions can be calculated because they transport to the start/end of the floor. Simply multiply the velocity by the number of seconds and add that to the position, then take the modulus of width/height.
        var xPosFinal = (robot.pos.x + (robot.vel.x * 100)) % bathroom.x
        var yPosFinal = (robot.pos.y + (robot.vel.y * 100)) % bathroom.y
        
        // If the velocity was negative, the position will be negative. This means the position needs to be subtracted from the end length.
        if xPosFinal < 0 { xPosFinal = bathroom.x + xPosFinal }
        if yPosFinal < 0 { yPosFinal = bathroom.y + yPosFinal }
        
        // Iterate the quandrants and see if it fits in any quadrant
        for (i, q) in quadrants.enumerated() {
            if q.x.contains(xPosFinal) && q.y.contains(yPosFinal) {
                // If the final position is in that quadrant, add 1 robot to that quadrant result
                result[i] += 1
            }
        }
        
    }
    
    // Multiply the results of each quadrant together
    return result.reduce(1, *)
}

func restroomRedoubtPartTwo(_ input: String, bathroom: GridPair) -> Int {
    
    let robots = input.inputToRobots()
    
    // Choose some arbitrary large number
    for second in 0...10000 {
                
        // Create the floor that can be used to print
        var floor = Array(repeating: Array(repeating: ".",
                                           count: bathroom.x),
                          count: bathroom.y)
        
        for robot in robots {
            // Use the same tactic as part one to move the robots
            // This could have probably been a frame by frame algorithm instead of maths, but both will take O(n) robots time so might as well keep the original algo
            var xPosFinal = (robot.pos.x + (robot.vel.x * second)) % bathroom.x
            var yPosFinal = (robot.pos.y + (robot.vel.y * second)) % bathroom.y
            
            if xPosFinal < 0 { xPosFinal = bathroom.x + xPosFinal }
            if yPosFinal < 0 { yPosFinal = bathroom.y + yPosFinal }
            
            // Update the floor position so we can see the robot position when the floor is printed
            floor[yPosFinal][xPosFinal] = "#"
        }
        
        // Use a function to calculate a 'touch score' of how many robots are touching another robot
        let score = floor.calculateTouchScore()
        // If more than 70% of the robots are touching, print the floor so we can see
        if score > robots.count * 70 / 100 {
            floor.printBathroomFloor()
            // Only one frame actually has more that 70% touching, so we can go ahead and return this
            return second
        }
    }
    
    // I will print the result to find the seconds and manually check for a tree
    return 0
}

extension [[String]] {
    // A helper to print the bathroom floor so we may see the image
    func printBathroomFloor() {
        for i in self {
            var line = ""
            for j in i {
                line.append(j)
            }
            print(line)
        }
    }
    
    // A helper to calculate how many robots are touching another robot
    // This function is definitely what is slowing down the solve time, but its quick enough for me to get a solution so I leave it
    func calculateTouchScore() -> Int {
        var score = 0
        for (y, row) in self.enumerated() {
            for (x, char) in row.enumerated() {
                if char == "#",
                   y > 0, y < self.count - 1,
                   x > 0, x < row.count - 1,
                   (self[y+1][x] == "#" || self[y-1][x] == "#"
                    || self[y][x+1] == "#" || self[y][x-1] == "#") {
                    score += 1
                }
            }
        }
        return score
    }
}
