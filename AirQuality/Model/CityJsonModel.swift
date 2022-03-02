//
//  CityJsonModel.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import Foundation
/// struct used for parsing json value. this is intermidiatory containder and is used for creating CityModel
struct CityJson: Codable {
    let city:String
    let aqi:Double
}
