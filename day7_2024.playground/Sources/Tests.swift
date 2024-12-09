import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        190: 10 19
                        3267: 81 40 27
                        83: 17 5
                        156: 15 6
                        7290: 6 8 6 15
                        161011: 16 10 13
                        192: 17 8 14
                        21037: 9 7 18 13
                        292: 11 6 16 20
                        """
    
    func testPartOneExample() {
        let expected = 3749
        let actual = bridgeRepair(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 1260333054159
        let actual = bridgeRepair(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 11387
        let actual = bridgeRepairPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    // Part 2 takes around 47 seconds to complete, this could definitely be improved if needed
    func testPartTwo() {
        let expected = 162042343638683
        let actual = bridgeRepairPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
