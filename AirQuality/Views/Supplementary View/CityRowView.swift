//
//  CityRowView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI

struct CityRowView: View {
    
    @Binding var cityModel:CityModel
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment:.top) {
                
                AQIGaugeView(cityModel: $cityModel)
                
                VStack(alignment:.leading, spacing: 8) {
                    Text(cityModel.city)
                        .font(.title2)
                        .bold()
                    Text("Air Quality is ") +
                    Text(cityModel.aqiCategory).foregroundColor(Color(cityModel.aqiColor)).bold() +
                    Text(".")
                    Text("\(cityModel.timeAgo)").foregroundColor(Color(uiColor: .secondaryLabel))
                }
                Spacer()
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(10)
    }
}

struct CityRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        CityRowView(cityModel: .constant( CityModel(city: "Delhi", aqi: 100.20)))
            .frame(width:300, height: 150)
    }
}
