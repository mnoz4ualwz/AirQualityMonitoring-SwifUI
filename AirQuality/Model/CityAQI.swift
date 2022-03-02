//
//  CityAQI.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import Foundation
/// Not in use, constructed this to be used in bar graph hower effect.
struct CityAQI: Identifiable {
    var id = UUID()
    var aqi: Double
    var date : Date
    var city : String
}

extension CityAQI {
    var timeAgo:String  {
        get {
            return self.date.timeAgoSinceDate()
        }
    }
}
