import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        Button A: X+94, Y+34
                        Button B: X+22, Y+67
                        Prize: X=8400, Y=5400

                        Button A: X+26, Y+66
                        Button B: X+67, Y+21
                        Prize: X=12748, Y=12176

                        Button A: X+17, Y+86
                        Button B: X+84, Y+37
                        Prize: X=7870, Y=6450

                        Button A: X+69, Y+23
                        Button B: X+27, Y+71
                        Prize: X=18641, Y=10279
                        """
    
    func testPartOneExample() {
        let expected = 480
        let actual = clawContraption(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 30973
        let actual = clawContraption(input)
        
        XCTAssertEqual(expected, actual)
    }
    
//    func testPartTwoExample() {
//        let expected = 0
//        let actual = clawContraptionPartTwo(exampleInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
    func testPartTwo() {
        let expected = 95688837203288
        let actual = clawContraption(input, isPartTwo: true)
        
        XCTAssertEqual(expected, actual)
    }
}
