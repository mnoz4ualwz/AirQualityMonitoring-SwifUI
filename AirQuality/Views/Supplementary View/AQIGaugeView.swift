//
//  AQIGaugeView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI
/// Gauge view
struct AQIGaugeView: View {
    
    @Binding var cityModel: CityModel
    
    var body: some View {
        VStack() {
            GaugeView(title: "AQI", value: cityModel.aqi, maxValue: 500, colors: [.white, Color(uiColor: .separator)])
                .frame(width: 50, height: 50)
                .padding()
                .background(Color(cityModel.aqiColor))
                .cornerRadius(10)
            
            Text(cityModel.aqiPriciseTo2Digit)
                .font(.system(size: 15))
                .bold()
        }
    }
}

struct AQIGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        AQIGaugeView(cityModel: .constant(CityModel(city: "Mumbai", aqi: 100)))
    }
}
