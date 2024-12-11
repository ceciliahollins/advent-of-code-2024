
struct DiskMap {
    var blocks: [DiskBlock] = []
    
    // A helper function used for debugging
    func printBlocks() {
        var line = ""
        
        for block in blocks {
            switch block.type {
            case .free:
                line.append(String(repeating: ".", count: block.space))
            case .file(let id):
                line.append(String(repeating: "\(id)", count: block.space))
            }
        }
        
        print(line)
    }
}

struct DiskBlock {
    var type: BlockType
    var space: Int
}

enum BlockType {
    case free
    case file(id: Int)
}




