import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        47|53
                        97|13
                        97|61
                        97|47
                        75|29
                        61|13
                        75|53
                        29|13
                        97|29
                        53|29
                        61|53
                        97|53
                        61|29
                        47|13
                        75|47
                        97|75
                        47|61
                        75|61
                        47|29
                        75|13
                        53|13

                        75,47,61,53,29
                        97,61,53,29,13
                        75,29,13
                        75,97,47,61,53
                        61,13,29
                        97,13,75,29,47
                        """
    
    func testPartOneExample() {
        let expected = 143
        let actual = printQueue(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 4578
        let actual = printQueue(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 123
        let actual = printQueuePartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 6179
        let actual = printQueuePartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
