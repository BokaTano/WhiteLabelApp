//
//  Model.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Bond
import Foundation

struct Item {
    var valueString: String
    var valueInt: Int
    var isValue: Bool

    private enum CodingKeys: CodingKey {
        case valueString
        case valueInt
        case isValue
    }
}

extension Item: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(valueString, forKey: .valueString)
        try container.encode(valueInt, forKey: .valueInt)

        let isValueInt = isValue ? 1 : 0 //Converts Bool into Integer Example
        try container.encode(isValueInt, forKey: .isValue)
    }
}

extension Item: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        valueString = try container.decode(String.self, forKey: .valueString)
        valueInt = try container.decode(Int.self, forKey: .valueInt)

        let isValueInt = try container.decode(Int.self, forKey: .isValue)
        isValue = (isValueInt == 1) //Converts from Int into Bool Example
    }
}
