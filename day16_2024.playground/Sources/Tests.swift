import XCTest

public class Tests: XCTestCase {
    
    let easyExample = """
                      #####
                      #S#E#
                      #...#
                      #...#
                      #####
                      """
    
    let exampleInputOne =  """
                           ###############
                           #.......#....E#
                           #.#.###.#.###.#
                           #.....#.#...#.#
                           #.###.#####.#.#
                           #.#.#.......#.#
                           #.#.#####.###.#
                           #...........#.#
                           ###.#.#####.#.#
                           #...#.....#.#.#
                           #.#.#.###.#.#.#
                           #.....#...#.#.#
                           #.###.#.#.#.#.#
                           #S..#.....#...#
                           ###############
                           """
    
    let exampleInputTwo =  """
                           #################
                           #...#...#...#..E#
                           #.#.#.#.#.#.#.#.#
                           #.#.#.#...#...#.#
                           #.#.#.#.###.#.#.#
                           #...#.#.#.....#.#
                           #.#.#.#.#.#####.#
                           #.#...#.#.#.....#
                           #.#.#####.#.###.#
                           #.#.#.......#...#
                           #.#.###.#####.###
                           #.#.#...#.....#.#
                           #.#.#.#####.###.#
                           #.#.#.........#.#
                           #.#.#.#########.#
                           #S#.............#
                           #################
                           """
    
    // https://www.reddit.com/r/adventofcode/comments/1hfhgl1/2024_day_16_part_1_alternate_test_case/
    let exampleEdgeCaseOne = """
                             ###########################
                             #######################..E#
                             ######################..#.#
                             #####################..##.#
                             ####################..###.#
                             ###################..##...#
                             ##################..###.###
                             #################..####...#
                             ################..#######.#
                             ###############..##.......#
                             ##############..###.#######
                             #############..####.......#
                             ############..###########.#
                             ###########..##...........#
                             ##########..###.###########
                             #########..####...........#
                             ########..###############.#
                             #######..##...............#
                             ######..###.###############
                             #####..####...............#
                             ####..###################.#
                             ###..##...................#
                             ##..###.###################
                             #..####...................#
                             #.#######################.#
                             #S........................#
                             ###########################
                             """
    
    // https://www.reddit.com/r/adventofcode/comments/1hfhgl1/2024_day_16_part_1_alternate_test_case/
    let exampleEdgeCaseTwo = """
                             ##########
                             #.......E#
                             #.##.#####
                             #..#.....#
                             ##.#####.#
                             #S.......#
                             ##########
                             """
    
    func testPartOneExample() {
//        let expectedZero = 3004
//        let actualZero = reindeerMaze(easyExample)
//        XCTAssertEqual(expectedZero, actualZero)
//        
//        let expectedOne = 7036
//        let actualOne = reindeerMaze(exampleInputOne)
//        XCTAssertEqual(expectedOne, actualOne)
        
        let expectedTwo = 11048
        let actualTwo = reindeerMaze(exampleInputTwo)
        XCTAssertEqual(expectedTwo, actualTwo)
        
//        let expectedThree = 21148
//        let actualThree = reindeerMaze(exampleEdgeCaseOne)
//        XCTAssertEqual(expectedThree, actualThree)
//        
//        let expectedFour = 4013
//        let actualFour = reindeerMaze(exampleEdgeCaseTwo)
//        XCTAssertEqual(expectedFour, actualFour)
    }

//    func testPartOne() {
//        // 355156 too high
//        // 200704 too high
//        let expected = 0
//        let actual = reindeerMaze(input)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample() {
//        let expected = 0
//        let actual = reindeerMazePartTwo(exampleInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
//    
//    func testPartTwo() {
//        let expected = 0
//        let actual = reindeerMazePartTwo(input)
//        
//        XCTAssertEqual(expected, actual)
//    }
}
