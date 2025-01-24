import XCTest

public class Tests: XCTestCase {
    
    let exampleInput = """
                       p=0,4 v=3,-3
                       p=6,3 v=-1,-3
                       p=10,3 v=-1,2
                       p=2,0 v=2,-1
                       p=0,0 v=1,3
                       p=3,0 v=-2,-2
                       p=7,6 v=-1,-3
                       p=3,0 v=-1,-2
                       p=9,3 v=2,3
                       p=7,3 v=-1,2
                       p=2,4 v=2,-3
                       p=9,5 v=-3,-3
                       """
    
    func testPartOneExample() {
        let expected = 12
        let actual = restroomRedoubt(exampleInput, bathroom: GridPair(11, 7))
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 222062148
        let actual = restroomRedoubt(input, bathroom: GridPair(101, 103))

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 7520
        let actual = restroomRedoubtPartTwo(input, bathroom: GridPair(101, 103))

        XCTAssertEqual(expected, actual)
    }
}
