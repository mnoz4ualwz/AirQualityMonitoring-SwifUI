//
//  GaugeDetailView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 28/02/22.
//

import SwiftUI

struct GaugeDetailView: View {
    
    @Binding var cityModel:CityModel
    
    var body: some View {
        ZStack {
            GaugeView(title: "", value: cityModel.aqi, maxValue: 500, colors:
                        [Color(AQIStandards.good.rawValue),
                         Color(AQIStandards.satisfactory.rawValue),
                         Color(AQIStandards.moderate.rawValue),
                         Color(AQIStandards.poor.rawValue),
                         Color(AQIStandards.veryPoor.rawValue),
                         Color(AQIStandards.severe.rawValue)])
            
            VStack(spacing:10) {
                Text(cityModel.aqiPriciseTo2Digit).font(.title)
                    .bold()
                Text("AQI").font(.headline)
            }
        }
    }
}

struct GaugeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeDetailView(cityModel: .constant(CityModel(city: "Mumbai", aqi: 200)))
    }
}
