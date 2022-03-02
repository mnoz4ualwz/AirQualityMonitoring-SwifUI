//
//  AirQualityStandardView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI

// This view presents AQI standards for the reference.
struct AirQualityStandardView: View {
    
    @Environment(\.dismiss) var dismiss
    
    /// AQI standards provided by central air quality authority.
    let items = [
        StandardsRowItem(label: "AQI",
                        value: "CATEGORY",
                        backgroundColor: .white),
        StandardsRowItem(label: "0-50",
                        value: "Good",
                        backgroundColor: Color(AQIStandards.good.rawValue)),
        StandardsRowItem(label: "51-100",
                        value: "Satisfactory",
                        backgroundColor: Color(AQIStandards.satisfactory.rawValue)),
        StandardsRowItem(label: "101-200",
                        value: "Moderate",
                        backgroundColor: Color(AQIStandards.moderate.rawValue)),
        StandardsRowItem(label: "201-300",
                        value: "Poor",
                        backgroundColor: Color(AQIStandards.poor.rawValue)),
        StandardsRowItem(label: "301-400",
                        value: "Very poor",
                        backgroundColor: Color(AQIStandards.veryPoor.rawValue)),
        StandardsRowItem(label: "401-500",
                        value: "Severe",
                        backgroundColor: Color(AQIStandards.severe.rawValue))
    ]
    
    var body: some View {
        ZStack {
            /// background
            Color(uiColor:.systemGroupedBackground)
            
            /// city table
            VStack(spacing:8) {
                /// Dismiss button
                Button {
                    dismiss()
                } label: {
                    Text("Dismiss")
                        .padding()
                }
                /// table with list of Standard row.
                ForEach(items, id:\.id) { item in
                    /// Standard row.
                    StandardRowView(data: [item.label, item.value], backgroundColor: item.backgroundColor)

                }
                Spacer()
            }
            .ignoresSafeArea()
            .padding()
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}

struct AirQualityStandardView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityStandardView()
    }
}
