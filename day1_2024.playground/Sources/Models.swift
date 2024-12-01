// Part one solution iterates through both locationIDs at the same time and compares integers
// Two arrays to be iterated is an ideal model for part one
struct Locations {
    var leftList: [Int] = []
    var rightList: [Int] = []
}

// Part two solution iterates through the left list, and compares how many times the integer appears in the right list
// Order matters for the left list, but not the right list
// Because of this, update the right list to be a dictionary that will track the number of times that integer appears
struct LocationsPartTwo {
    var leftList: [Int] = []
    var rightList: [Int: Int] = [:]
}


