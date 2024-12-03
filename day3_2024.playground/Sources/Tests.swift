import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    let exampleInputPartTwo = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    
    func testPartOneExample() {
        let expected = 161
        let actual = mullItOver(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 167650499
        let actual = mullItOver(input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 48
        let actual = mullItOverPartTwo(exampleInputPartTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 95846796
        let actual = mullItOverPartTwo(input)
        
        XCTAssertEqual(expected, actual)
    }
}
