import Foundation

public func clawContraption(_ input: String, isPartTwo: Bool = false) -> Int {
    
    
    let clawMachines = input.inputToClawMachine()
    
    var result = 0
    for machine in clawMachines {
        
        // Use system of equations to create an equation for the x and y values
        // (buttonA x movement * buttonA num of pushes) + (buttonB x movement * buttonB num of pushes) = prize x position
        // (buttonA y movement * buttonA num of pushes) + (buttonB y movement * buttonB num of pushes) = prize y position
        
        // Isolate buttonA num of pushes for the first equation
        // buttonA num of pushes = (prize x position - (buttonB x movement * buttonB num of pushes)) / buttonA x movement
        
        // Substitute the buttonA num of pushes in the second equation
        // (buttonA y movement * (prize x position - (buttonB x movement * buttonB num of pushes)) / buttonA x movement) + (buttonB y movement * buttonB num of pushes) = prize y position
        
        // Isolate buttonB num of pushes
        // buttonB num of pushes = ((buttonA x movement * prize y position) - (buttonA y movement * prize x position) / (buttonA x movement * buttonB y movement) - (buttonA y movement * buttonB x movement))
        
        // Use these two equations to calculate
        // Ensure the result is an intenger and not a double. because it is not possible to do a fraction of a button push
        
        // Cast all integers to doubles for calculation purposes
        let ax: Double = Double(machine.buttonA.x)
        let ay: Double = Double(machine.buttonA.y)
        let bx: Double = Double(machine.buttonB.x)
        let by: Double = Double(machine.buttonB.y)
        var px: Double = Double(machine.prize.x)
        var py: Double = Double(machine.prize.y)
        
        // Add the updated location if we are doing part 2
        let updatedPrizeLocation = isPartTwo ? 10000000000000.0 : 0.0
        px += updatedPrizeLocation
        py += updatedPrizeLocation
                
        // buttonB num of pushes = ((buttonA x movement * prize y position) - (buttonA y movement * prize x position) / (buttonA x movement * buttonB y movement) - (buttonA y movement * buttonB x movement))
        let bPushes: Double = ((ax * py) - (ay * px)) / ((ax * by) - (ay * bx))
        
        // buttonA num of pushes = (prize x position - (buttonB x movement * buttonB num of pushes)) / buttonA x movement
        let aPushes: Double = (px - (bx * bPushes)) / ax
                
        if aPushes == floor(aPushes),
            bPushes == floor(bPushes) {
            result += Int((aPushes * 3) + bPushes)
        }
    }
    
    return result
}
