extension String {
    
    func inputToDiskMap() -> DiskMap {
        
        var diskMap: DiskMap = DiskMap()
        
        // Process each character in the single line
        // Create a variable to track if the char refers to free space or file space
        var isFreeSpace = false
        var id = 0
        for char in self {
            guard let space = Int(String(char)) else { continue }
            
            let block: DiskBlock
            if isFreeSpace {
                block = DiskBlock(type: .free, space: space)
            } else {
                block = DiskBlock(type: .file(id: id), space: space)
                id += 1
            }
            
            diskMap.blocks.append(block)
            isFreeSpace.toggle()
        }
        
        return diskMap
    }
}
