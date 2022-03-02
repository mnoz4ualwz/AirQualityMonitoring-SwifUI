//
//  StandardsRowItem.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import Foundation
import SwiftUI
/// Model for AQI standards.
struct StandardsRowItem: Hashable {
    let id = UUID()
    var label:String
    var value:String
    var backgroundColor:Color
}
