extension String {
    
    func inputToSafetyProtocol() -> SafetyProtocol {
        
        var safetyProtocol = SafetyProtocol()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
           
        // Process each line
        for line in lines {
            
            let sectionOnePages = line.split(separator: "|")
            if let firstPage = Int(sectionOnePages[0]),
                let secondPage = Int(sectionOnePages[1]) {
                safetyProtocol.pageRules[firstPage, default: []].insert(secondPage)
            }
            
            let sectionTwoUpdates = line.split(separator: ",")
            var pageOrder: [Int] = []
            for split in sectionTwoUpdates {
                if let num = Int(split) {
                    pageOrder.append(num)
                }
            }
            
            if !pageOrder.isEmpty {
                safetyProtocol.pageOrders.append(pageOrder)
            }
        }
        
        return safetyProtocol
    }
}
