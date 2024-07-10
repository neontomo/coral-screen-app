//
//  Item.swift
//  coral screen
//
//  Created by Tomo Myrman on 2024-07-10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
