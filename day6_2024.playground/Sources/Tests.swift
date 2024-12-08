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
        let expected = 0
        let actual = guardGallivantPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
