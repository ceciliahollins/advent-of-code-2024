import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        3   4
                        4   3
                        2   5
                        1   3
                        3   9
                        3   3
                        """
    
    func testPartOneExample() {
        let expected = 11
        let actual = historianHysteria(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 1938424
        let actual = historianHysteria(input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 31
        let actual = historianHysteriaPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 0
        let actual = historianHysteriaPartTwo(input)
        
        XCTAssertEqual(expected, actual)
    }
}
