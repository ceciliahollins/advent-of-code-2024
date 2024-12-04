import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        MMMSXXMASM
                        MSAMXMSMSA
                        AMXSXMAAMM
                        MSAMASMSMX
                        XMASAMXAMM
                        XXAMMXXAMA
                        SMSMSASXSS
                        SAXAMASAAA
                        MAMMMXMMMM
                        MXMXAXMASX
                        """
    
    func testPartOneExample() {
        let expected = 18
        let actual = ceresSearch(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 2662
        let actual = ceresSearch(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 9
        let actual = ceresSearchPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 2034
        let actual = ceresSearchPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
