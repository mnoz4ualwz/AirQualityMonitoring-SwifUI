//
//  AQIStandards.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 28/02/22.
//

import Foundation

enum AQIStandards : String {
    
    case good            = "AQIGood"
    case satisfactory    = "AQISatisfactory"
    case moderate        = "AQIModerate"
    case poor            = "AQIPoor"
    case veryPoor        = "AQIVeryPoor"
    case severe          = "AQISevere"
    
    static func colorName(aqi:Double) -> AQIStandards {
        switch aqi {
        case 0...50:
            return .good
        case 50...100:
            return .satisfactory
        case 100...200:
            return .moderate
        case 200...300:
            return .poor
        case 300...400:
            return .veryPoor
        case 400...500:
            return .severe
        default:
            return .severe
        }
    }
    
    static func categoryName(aqi:Double) -> String {
        switch aqi {
        case 0...50:
            return "Good"
        case 50...100:
            return "Satisfactory"
        case 100...200:
            return "Moderate"
        case 200...300:
            return "Poor"
        case 300...400:
            return "Very Poor"
        case 400...500:
            return "Severe"
        default:
            return "Severe"
        }
    }
}






