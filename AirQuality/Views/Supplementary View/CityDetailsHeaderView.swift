//
//  CityDetailsHeaderView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import SwiftUI

struct CityDetailsHeaderView: View {
    
    @Binding var cityitem: CityModel
    
    @Binding var isCircleView:Bool
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment:.center) {
                Text(cityitem.city)
                    .font(.title2)
                    .bold()
                Spacer()
                AnimatingView()
            }
            HStack {
                Text("Air Quality is ") +
                Text(cityitem.aqiCategory).foregroundColor(Color(cityitem.aqiColor)).bold() +
                Text(".")
                Spacer()
                
                Button {
                    withAnimation {
                        isCircleView.toggle()
                    }
                    
                } label: {
                    
                    Group {
                        if isCircleView {
                            Text("Gauge View")
                                .bold()
                        }else {
                            
                            Text("Circle View")
                                .bold()
                        }
                    }
                }
            }
            
            Text("\(cityitem.timeAgo)").foregroundColor(Color(uiColor: .secondaryLabel))
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(10)
    }
}

struct CityDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsHeaderView(cityitem: .constant(CityModel(city: "Mumbai", aqi: 200)), isCircleView: .constant(false))
    }
}
