import XCTest

public class Tests: XCTestCase {
    
    let exampleInputOne =  """
                           AAAA
                           BBCD
                           BBCC
                           EEEC
                           """
    
    let exampleInputTwo =  """
                           RRRRIICCFF
                           RRRRIICCCF
                           VVRRRCCFFF
                           VVRCCCJFFF
                           VVVVCJJCFE
                           VVIVCCJJEE
                           VVIIICJJEE
                           MIIIIIJJEE
                           MIIISIJEEE
                           MMMISSJEEE
                           """
    
    let exampleInputThree = """
                            EEEEE
                            EXXXX
                            EEEEE
                            EXXXX
                            EEEEE
                            """
    
    let exampleInputFour = """
                           AAAAAA
                           AAABBA
                           AAABBA
                           ABBAAA
                           ABBAAA
                           AAAAAA
                           """
    
    let exampleInputFive = """
                           AAAEAAAAAA
                           FFAEAADAAA
                           FFAAAADACA
                           FFAABAAAAB
                           FFABBBABBB
                           FAAAABBBBB
                           FAGGABBBBB
                           FAGAABBBBB
                           """
    
    let exampleInputSix = """
                          LDDDDDDXXX
                          LLLDDVDXXX
                          LLLDDDXXXX
                          """
    
    let exampleInputSeven = """
                            BBBBBC
                            BAAABC
                            BABABC
                            BAABBB
                            BABABC
                            BAAABC
                            """
    
    let exampleInputEight = """
                            AAAAA
                            ABABA
                            ABBBA
                            ABABA
                            """
    
    func testPartOneExample() {
        let expectedOne = 140
        let actualOne = gardenGroups(exampleInputOne)
        XCTAssertEqual(expectedOne, actualOne)
        
        let expectedTwo = 1930
        let actualTwo = gardenGroups(exampleInputTwo)
        XCTAssertEqual(expectedTwo, actualTwo)
    }
    
    func testPartOne() {
        let expected = 1546338
        let actual = gardenGroups(input)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expectedOne = 80
        let actualOne = gardenGroupsPartTwo(exampleInputOne)
        XCTAssertEqual(expectedOne, actualOne)
        
        let expectedTwo = 1206
        let actualTwo = gardenGroupsPartTwo(exampleInputTwo)
        XCTAssertEqual(expectedTwo, actualTwo)
        
        let expectedThree = 236
        let actualThree = gardenGroupsPartTwo(exampleInputThree)
        XCTAssertEqual(expectedThree, actualThree)
        
        let expectedFour = 368
        let actualFour = gardenGroupsPartTwo(exampleInputFour)
        XCTAssertEqual(expectedFour, actualFour)
        
        let expectedFive = 1992
        let actualFive = gardenGroupsPartTwo(exampleInputFive)
        XCTAssertEqual(expectedFive, actualFive)
        
        let expectedSix = 250
        let actualSix = gardenGroupsPartTwo(exampleInputSix)
        XCTAssertEqual(expectedSix, actualSix)
        
        let expectedSeven = 492
        let actualSeven = gardenGroupsPartTwo(exampleInputSeven)
        XCTAssertEqual(expectedSeven, actualSeven)
        
        let expectedEight = 232
        let actualEight = gardenGroupsPartTwo(exampleInputEight)
        XCTAssertEqual(expectedEight, actualEight)
    }

    func testPartTwo() {
        let expected = 0
        let actual = gardenGroupsPartTwo(input)

        XCTAssertEqual(expected, actual)
    }
}
