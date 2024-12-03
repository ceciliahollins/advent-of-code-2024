import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        7 6 4 2 1
                        1 2 7 8 9
                        9 7 6 2 1
                        1 3 2 4 5
                        8 6 4 4 1
                        1 3 6 7 9
                        """
    
    func testPartOneExample() {
        let expected = 2
        let actual = redNosedReports(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 252
        let actual = redNosedReports(input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 4
        let actual = redNosedReportsPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 324
        let actual = redNosedReportsPartTwo(input)
        
        XCTAssertEqual(expected, actual)
    }
}
