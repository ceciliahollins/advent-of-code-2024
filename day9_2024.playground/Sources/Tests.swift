import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  "2333133121414131402"
    
    func testPartOneExample() {
        let expected = 1928
        let actual = diskFragmenter(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 6216544403458
        let actual = diskFragmenter(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 2858
        let actual = diskFragmenterPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    // This takes about 14 seconds to run, could be improved
    func testPartTwo() {
        let expected = 6237075041489
        let actual = diskFragmenterPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
