import XCTest

public class Tests: XCTestCase {
    
    let exampleInputOne =  """
                           ########
                           #..O.O.#
                           ##@.O..#
                           #...O..#
                           #.#.O..#
                           #...O..#
                           #......#
                           ########
                           
                           <^^>>>vv<v>>v<<
                           """
    
    let exampleInputOnePartTwo =  """
                                  #######
                                  #...#.#
                                  #.....#
                                  #..OO@#
                                  #..O..#
                                  #.....#
                                  #######

                                  <vv<<^^<<^^
                                  """
    
    let exampleInputTwo =  """
                           ##########
                           #..O..O.O#
                           #......O.#
                           #.OO..O.O#
                           #..O@..O.#
                           #O#..O...#
                           #O..O..O.#
                           #.OO.O.OO#
                           #....O...#
                           ##########

                           <vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
                           vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
                           ><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
                           <<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
                           ^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
                           ^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
                           >^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
                           <><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
                           ^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
                           v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^
                           """
    
    func testPartOneExample() {
        let expectedOne = 2028
        let actualOne = warehouseWoes(exampleInputOne)
        
        XCTAssertEqual(expectedOne, actualOne)
        
        let expectedTwo = 10092
        let actualTwo = warehouseWoes(exampleInputTwo)
        
        XCTAssertEqual(expectedTwo, actualTwo)
    }
    
    func testPartOne() {
        let expected = 1383666
        let actual = warehouseWoes(input)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 9021
        let actual = warehouseWoesPartTwo(exampleInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 1412866
        let actual = warehouseWoesPartTwo(input)
        
        XCTAssertEqual(expected, actual)
    }
}
