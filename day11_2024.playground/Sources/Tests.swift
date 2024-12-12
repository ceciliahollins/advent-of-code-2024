import XCTest

public class Tests: XCTestCase {
    
    let exampleInput = [125, 17]
    
    func testPartOneExample() {
        let expected = 22
        let actual = plutonianPebbles(exampleInput, blinks: 6)
        XCTAssertEqual(expected, actual)
        
        let expected2 = 55312
        let actual2 = plutonianPebbles(exampleInput, blinks: 25)
        XCTAssertEqual(expected2, actual2)
    }
    
    // This part runs in about 3 seconds and was improved in part two, but I kept it to show the initial solution vs improved
    // What is cool is that even though part 2 is three times the amount of blinks as part 1, it takes a third of the time to run
    func testPartOne() {
        let expected = 183248
        let actual = plutonianPebbles(input, blinks: 25)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 22
        let actual = plutonianPebblesPartTwo(exampleInput, blinks: 6)
        XCTAssertEqual(expected, actual)
        
        let expected2 = 55312
        let actual2 = plutonianPebblesPartTwo(exampleInput, blinks: 25)
        XCTAssertEqual(expected2, actual2)
    }

    func testPartTwo() {
        let expected = 218811774248729
        let actual = plutonianPebblesPartTwo(input, blinks: 75)

        XCTAssertEqual(expected, actual)
    }
}
