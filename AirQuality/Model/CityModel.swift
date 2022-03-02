//
//  CityModel.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import Foundation

/// Model used for representing city AQI
class CityModel:Identifiable, Equatable {
    /// Equatable conformance
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        lhs.city == rhs.city && lhs.id == rhs.id
    }
    /// Identifiable id
    let id   = UUID()
    /// This date indicate last updated
    var date = Date()  // For displayhing ago time to current time.
    /// city name
    let city:String
    /// aqi value
    var aqi:Double
    
    /// initializer
    init(city:String, aqi:Double) {
        self.city = city
        self.aqi = aqi
    }
}

/// This extension hold infomations required for showing particular city information.
extension CityModel {
    /// When was city updated relative to current date and in textual formate
    var timeAgo:String  {
        get {
            
            return self.date.timeAgoSinceDate()
        }
    }
    
    /// aqi string value in 2 decimal palces.
    var aqiPriciseTo2Digit:String {
        get {
            return String(format: "%.2f", self.aqi)
        }
    }
    
    /// aqi color string value based on aqi
    var aqiColor:String {
        get {
            return AQIStandards.colorName(aqi: self.aqi).rawValue
        }
    }
    
    /// aqi category based on aqi value.
    var aqiCategory:String {
        get {
            return AQIStandards.categoryName(aqi: self.aqi)
        }
    }
}
