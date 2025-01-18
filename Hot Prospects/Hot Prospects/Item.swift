//
//  Item.swift
//  Hot Prospects
//
//  Created by mac on 30/12/24.
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
