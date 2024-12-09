import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        ....#.....
                        .........#
                        ..........
                        ..#.......
                        .......#..
                        ..........
                        .#..^.....
                        ........#.
                        #.........
                        ......#...
                        """
    
    func testPartOneExample() {
        let expected = 41
        let actual = guardGallivant(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 4988
        let actual = guardGallivant(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 6
        let actual = guardGallivantPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 1697
        let actual = guardGallivantPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
    
    // MARK: I was struggling with part 2, here more tests from reddit
    // https://www.reddit.com/r/adventofcode/comments/1h9vx1a/2024_day_6_part_2_typescript_please_someone_find/
    // The edge case I missed was that if the guard has already visited a spot in their route where I wanted to put a block, this would not produce the results I wanted as the guard would hit the object before I expect it to
    
    let exampleInputTwo = """
                          ..#.....
                          .......#
                          ........
                          .#......
                          #...#...
                          #.......
                          ..^...#.
                          """
    
    func testPartTwoExampleTwo() {
        let expected = 4
        let actual = guardGallivantPartTwo(exampleInputTwo)

        XCTAssertEqual(expected, actual)
    }
    
    let exampleInputThree = """
                            ##..
                            ...#
                            ....
                            ^.#.
                            """
    
    func testPartTwoExampleThree() {
        let expected = 0
        let actual = guardGallivantPartTwo(exampleInputThree)

        XCTAssertEqual(expected, actual)
    }
    
    let exampleInputFour = """
                           ...#
                           #...
                           .^#.
                           """
    
    func testPartTwoExampleFour() {
        let expected = 0
        let actual = guardGallivantPartTwo(exampleInputFour)

        XCTAssertEqual(expected, actual)
    }
}
