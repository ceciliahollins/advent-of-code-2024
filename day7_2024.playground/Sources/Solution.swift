import Foundation

public func bridgeRepair(_ input: String) -> Int {
    
    let equations = input.inputToEquations()
    
    var result = 0
    
    for equation in equations {
        
        // Construct a tree from the operation
        // The first node should add the first value in the list
        // When the tree is calculated, it will start at 0 and perform the operations
        // Because of this, the first operation needs to add itself to 0
        
        // In the equation 190: 10 19
        // The tree will look as follows:
        /*
                + 10
                /   \
            + 19    * 19
         */
        let operationsTree = TreeNode(value: "+\(equation.value.first ?? 0)")
        constructTree(operationsTree, children: Array(equation.value.dropFirst()))
        
        // Depth first calculate the operation options
        // Start the calculated value at 0, and send through what the expected final value is
        if depthFirstCalculation(operationsTree, currVal: 0, finalVal: equation.key) {
            // If any operations return true, add it to the result
            result += equation.key
        }
    }
    
    return result
}

public func bridgeRepairPartTwo(_ input: String) -> Int {
    
    let equations = input.inputToEquations()
    var result = 0
    
    // Similar to part 1, but add the true flag in the construction of the tree
    
    for equation in equations {
        let operationsTree = TreeNode(value: "+\(equation.value.first ?? 0)")
        constructTree(operationsTree, children: Array(equation.value.dropFirst()))
        
        if depthFirstCalculation(operationsTree, currVal: 0, finalVal: equation.key) {
            result += equation.key
        }
    }
    
    return result
}

// A recursive helper function to contstruct the tree given the node and the children to add
// Part two allows for another operation, and is denoted by the isPartTwo parameter
func constructTree(_ node: TreeNode<String>, children: [Int], isPartTwo: Bool = false) {
    
    // Ensure there are more children to add, and take the first child
    guard let val = children.first else { return }
    
    
    // Add the addition and multiplication operation as children of the current node
    node.addChild(TreeNode(value: "+\(val)"))
    node.addChild(TreeNode(value: "*\(val)"))
    
    
    // If it is part two, add the new operation
    // The directions say it is denoted by "||", but it doesn't actually matter what we use because it does not come through the input
    if isPartTwo {
        node.addChild(TreeNode(value: "|\(val)"))
    }
    
    // Drop the child that has been added and recursively add the rest of the children
    let updatedChildren = Array(children.dropFirst())
    for child in node.children {
        constructTree(child, children: updatedChildren, isPartTwo: isPartTwo)
    }
}

func depthFirstCalculation(_ node: TreeNode<String>, currVal: Int, finalVal: Int) -> Bool {
    
    var expressionResult = 0
    
    // Since the | operation is one that is made up, check for this value to execute the special instructions
    if node.value.first == "|",
       // Combine the two numbers and give the result to the expressionResult variable
       // Drop the first character, which is the special operation | as it is not needed
       let val = Int("\(currVal)\(node.value.dropFirst())") {
        
        expressionResult = val
        
    } else {
        // Take the current value and the node value, which includes the operation, and create the expression
        let expression = NSExpression(format: "\(currVal)\(node.value)")
        // Calculate the expression
        if let calculatedVal = expression.expressionValue(with: nil, context: nil) as? Int {
            
            expressionResult = calculatedVal
        }
    }
    
    if node.children.isEmpty {
        // If there are no more children, check if the expression result is the expected final result and return
        return expressionResult == finalVal
    } else {
        // For each child, recursively call this method
        for child in node.children {
            // If any child returns true, there is a possible expression to get the final result
            // We can quit early and return true
            if depthFirstCalculation(child, currVal: expressionResult, finalVal: finalVal) {
                return true
            }
        }
    }

    return false
}
