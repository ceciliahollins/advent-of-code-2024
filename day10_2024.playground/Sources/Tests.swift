import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        89010123
                        78121874
                        87430965
                        96549874
                        45678903
                        32019012
                        01329801
                        10456732
                        """
    
    func testPartOneExample() {
        let expected = 36
        let actual = hoofIt(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 733
        let actual = hoofIt(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 81
        let actual = hoofItPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 1514
        let actual = hoofItPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
