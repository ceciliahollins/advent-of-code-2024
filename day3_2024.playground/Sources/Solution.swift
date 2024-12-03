import Foundation

public func mullItOver(_ input: String) -> Int {
    
    var mulResult: Int = 0
    
    // The start of this algorithm splits the string based on the start and end requirements for what a valid mul instruction is. This will produce a multitude of string splits, but valid instructions will isolate two integers seperated by a comma, which can then be processed. Any invalid instructions will not isolate these two integers properly, and will be discarded.
        
    let components = seperateMulComponents(input)
    
    // Iterate the components
    for component in components {
        
        // Check that the component is valid in the helper function, and add to the mulResult
        mulResult += executeMulInstruction(component)
    }
    
    return mulResult
}

public func mullItOverPartTwo(_ input: String) -> Int {
    
    var mulResult: Int = 0
            
    let components = seperateMulComponents(input)
    
    // Create a variable to track if the mul instruction should be added
    var enabled = true
    
    // Iterate the components
    for component in components {
        // This technically shouldn't work because the problem statement states the command is "do()" and "don't()"
        // However this messes with the "(" and ")" of the mul instruction
        // The input does not contain invalid instances of "do", "don't", "do(" or "don't(", so I will take advantage of this in my solution
        if component.contains("do") { enabled = true }
        if component.contains("don't") { enabled = false }
        
        // Only calculate the instruction if currently enabled
        if enabled {
            // Check that the component is valid in the helper function, and add to the mulResult
            mulResult += executeMulInstruction(component)
        }
    }
    
    return mulResult
}

// A helper function to seperate valid mul instructions from the rest of the invalid jibberish
func seperateMulComponents(_ input: String) -> [String] {
    // Create the start and end requirement for a valid mul instruction
    // These will split valid mul instructions
    let separators : [String] = ["mul(",")"]
    // Put the input into an array so the seperators can be applied
    var components: [String] = [input]
    // Iterator the seperators and seperate the start and end requirements from integers
    for separator in separators {
        // Flat map the array result to ensure no nested arrays
        components = components.flatMap { $0.components(separatedBy: separator) }
    }
    
    return components
}

// A helper function to decide if a component is valid/invalid, and execute valid mul instructions
func executeMulInstruction(_ component: String) -> Int {
    // If it is a valid component, the integers can be seperated by the comma
    let integers = component.components(separatedBy: ",")
    
    // Check that the component is valid, return the mul result
    if integers.count == 2,
       let firstInt = Int(integers[0]),
       let secondInt = Int(integers[1]) {
        return firstInt * secondInt
    }
    
    return 0
}
