//
//  CityDetailsView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI
import SwiftUICharts

struct CityDetailsView: View {
    /// city model binding received from city list
    @Binding             var cityitem:CityModel
    
    /// socket manager EnvironmentObject
    @EnvironmentObject   var socketManager: SocketManager
    /// this state var
    @State private var isCircleView = false

    /// bar graph style
    let barStyle = ChartStyle(backgroundColor: .clear,
                              accentColor: Color(uiColor: .systemBlue),
                                secondGradientColor: Color(uiColor: .systemBlue),
                                textColor: .black,
                                legendTextColor: .blue,
                                dropShadowColor: .clear)
    
        
    var body: some View {
        
        /// bar graph data
        /// filter city info for selected city
        /// sort result based on date descending
        /// get aqis
        let data = ChartData(points: socketManager.cityAQIHistory.filter { $0.city == cityitem.city }.sorted(by: { c1, c2  in
            c1.date < c2.date
        }).map{ $0.aqi })
       
        ZStack {
            /// background
            Color(uiColor: .systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment:.leading, spacing:20) {
                    
                    /// Gauge view and circle view of current AQI
                    HStack {
                        Spacer()
                        
                        Group {
                            if isCircleView {
                                AQICircleView(cityitem: $cityitem)
                                   
                            }else {
                                GaugeDetailView(cityModel: $cityitem)
                            }
                        }
                        .frame(width: 200, height: 200, alignment: .center)
                        
                        Spacer()
                    }
                    
                    /// City details and bar graph
                    VStack(spacing:20) {
                        CityDetailsHeaderView(cityitem: $cityitem, isCircleView: $isCircleView)
                        
                        BarChartView(data: data, title: "AQI", legend: "Legend", style:barStyle, form: ChartForm.extraLarge, dropShadow: false, valueSpecifier: "%.2f", animatedToBack: false)
                            .padding(5)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(10)
                            
                    }
                    .padding()
                    
                    Spacer()
                    
                }.padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Live Tracking")
        }
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView(cityitem: .constant(CityModel(city: "Dehli", aqi: 200.30)))
    }
}
