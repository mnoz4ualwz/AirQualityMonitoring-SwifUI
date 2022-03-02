//
//  AnimatingView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 01/03/22.
//

import SwiftUI

/// green circle view for displaying live status.
struct AnimatingView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        HStack(spacing:0) {
            Circle()
                .fill(Color(uiColor: .systemGreen))
            .overlay(
                Circle()
                    .stroke(Color(uiColor: .systemGreen))
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            
            Text("Live")
        }
        .frame(width: 80, height: 20, alignment: .center)
        .onAppear {
            animationAmount = 2
        }
    }
}

struct AnimatingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingView()
    }
}
