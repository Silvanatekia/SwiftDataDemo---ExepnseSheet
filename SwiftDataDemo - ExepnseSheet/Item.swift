//
//  Item.swift
//  SwiftDataDemo - ExepnseSheet
//
//  Created by Silvana Tekia on 27/02/2024.
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
