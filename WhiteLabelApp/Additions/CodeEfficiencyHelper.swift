//
//  CodeEfficiencyHelper.swift
//  WhiteLabelApp
//
//  Created by Lars Klimmeck on 05.12.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Foundation

//To test how long to funcs take to run and compare them
public func duration(of block: () -> Void) -> TimeInterval {
    let start = Date()
    block()
    let end = Date()
    let timeInterval = end.timeIntervalSince(start)
    return timeInterval
}

struct DurationComparison: CustomStringConvertible {
    var durationA: TimeInterval
    let durationB: TimeInterval

    var comparison: String {
        let slowerBlock = durationA > durationB ? "Block A" : "Block B"
        let fasterBlock = durationA > durationB ? "Block B" : "Block A"

        let difference = (durationA - durationB).magnitude

        return "\(fasterBlock) is \(difference) seconds faster than \(slowerBlock)"
    }

    var description: String {
        return """
        Block A Duration: \(durationA) seconds
        Block B Duration: \(durationB) seconds

        \(comparison)
        """
    }
}

//Example:  print(DurationComparison(durationA: duration(of: firstFunc), durationB: duration(of: SecondFunc))
//Result:   Block A Duration: 1.05 seconds
//          Block B Duration: 3.05 seconds
//
//          Block A is 1 seconds faster than Block B
