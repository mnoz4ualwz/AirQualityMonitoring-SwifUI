//
//  SwiftUIView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 28/02/22.
//

import SwiftUI

struct StandardRowView: View {
    var gridItem = [GridItem(.flexible(minimum: 180, maximum: .infinity)),
                    GridItem(.flexible(minimum: 180, maximum: .infinity))]
    var data:[String]
    var backgroundColor:Color
    var body: some View {
        LazyVGrid(columns: gridItem) {
            ForEach(data, id:\.self) { text in
                
                HStack(spacing:0) {
                    Text(text)
                        .bold()
                        .padding()
                    Spacer()
                }.background(backgroundColor)
            }
        }
    }
}

struct StandardRowView_Previews: PreviewProvider {
    static var previews: some View {
        StandardRowView(data: ["Key", "Value"], backgroundColor: .green)
    }
}
