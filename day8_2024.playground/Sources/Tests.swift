import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        ............
                        ........0...
                        .....0......
                        .......0....
                        ....0.......
                        ......A.....
                        ............
                        ............
                        ........A...
                        .........A..
                        ............
                        ............
                        """
    
    func testPartOneExample() {
        let expected = 14
        let actual = resonantCollinearity(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 354
        let actual = resonantCollinearity(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 34
        let actual = resonantCollinearityPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 1263
        let actual = resonantCollinearityPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
