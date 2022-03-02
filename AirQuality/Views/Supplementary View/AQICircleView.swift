//
//  AQICircleView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import SwiftUI

struct AQICircleView : View {
    
    @Binding var cityitem: CityModel
    
    var body: some View {
        VStack(alignment:.leading) {
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color(cityitem.aqiColor), radius: 50)
                VStack (spacing: 20) {
                    Text(cityitem.aqiPriciseTo2Digit)
                        .font(.title)
                        .bold()
                    Text("AQI")
                }
            }
        }
    }
}
struct AQICircleView_Previews: PreviewProvider {
    static var previews: some View {
        AQICircleView(cityitem: .constant(CityModel(city: "Mumbai", aqi: 200)))
    }
}
