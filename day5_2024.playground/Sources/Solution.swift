import Foundation

public func printQueue(_ input: String) -> Int {
    
    let safetyProtocol = input.inputToSafetyProtocol()
    
    var result = 0
    
    // Use the helper function to seperate out valid and invalid orders
    var validOrders = seperateOrders(safetyProtocol).validOrders
    
    // Add the middle number of the valid orders to the result
    for order in validOrders {
        result += order[order.count/2]
    }
    
    return result
}

public func printQueuePartTwo(_ input: String) -> Int {
    
    let safetyProtocol = input.inputToSafetyProtocol()
    
    var result = 0
    
    // Use the helper function to get incorrect orders
    let incorrectOrders = seperateOrders(safetyProtocol).invalidOrders
    
    // Iterate the incorrect orders
    for order in incorrectOrders {
        
        // Move the current order into a variable for mutation
        var sortedPageOrder = order
        
        // Sort the orders based on the pageRules in our safety protocol
        sortedPageOrder.sort { a, b in
            
            // If a is not in the page order rules of b, it is not breaking any rules
            // a can be placed before b in the order list
            return !(safetyProtocol.pageRules[b] ?? []).contains(a)
        }
        
        // Add the middle value to the final result
        result += sortedPageOrder[sortedPageOrder.count/2]
    }
    
    return result
}


// A helper function to seperate out the valid and non-valid page orders
func seperateOrders(_ safetyProtocol: SafetyProtocol) -> (validOrders: [[Int]],
                                                          invalidOrders: [[Int]]) {
    var validOrders: [[Int]] = []
    var invalidOrders: [[Int]] = []
    
    // Iterate the page order lists
    pageOrderLoop: for pageOrder in safetyProtocol.pageOrders {
        // Iterate each page number in the list
        for (i, pageNum) in pageOrder.enumerated() {
            
            /* Check the page numbers that come before this page in the list. Use the page rules dictionary to ensure no values in the page rules dictionary come before this number in the list. If there is a page number in the page rules that come before this page, then it is not valid. Otherwise, it is valid. */
            
            // Create the sub list of pages numbers before this one
            let pagesBefore = Set(pageOrder[0..<i])
            
            // Compare pagesBefore list to the pageRules list. Page rules specify all pages that are expected to be after the current page
            if let pageRules = safetyProtocol.pageRules[pageNum],
               !pagesBefore.intersection(pageRules).isEmpty {
                // If there are the same page numbers, this is an invalid order
                // Continue to the next line of page orders
                invalidOrders.append(pageOrder)
                continue pageOrderLoop
            }
        }
        
        // If the end is reached without breaking, it is a valid line
        validOrders.append(pageOrder)
    }
    
    return (validOrders, invalidOrders)
}
