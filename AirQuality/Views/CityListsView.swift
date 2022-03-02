//
//  CityView.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 26/02/22.
//

import SwiftUI

/// This view represent city data received from 

struct CityListsView: View {
    /// View Model
    @ObservedObject var vm:CityListViewModel
    /// AQI Standard screen presentation
    @State private  var presented  = false
    /// Search keyword
    @State private  var searchText = ""     /// Pending implementation.
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // Screen background
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                // Cities list in real time.
                ScrollView {
                    ForEach($vm.cities) { item in
                        /// NavigationLink for city detail screen passing a citymodel binding.
                        NavigationLink(destination: CityDetailsView(cityitem: item)) {
                            CityRowView(cityModel: item)
                                .frame(height: 130)
                                .padding(10)
                        }.buttonStyle(.plain)
                    }
                }
                .toolbar(content: {
                    /// This toolbar opens the standard reference screen.
                    Button {
                        presented.toggle()
                    } label: {
                        Text("AQI Reference")
                    }
                })
                .sheet(isPresented: $presented) {
                    
                } content: {
                    /// Air quality standard reference screen.
                    AirQualityStandardView()
                }
                .navigationTitle("Air Quality")
            }
            .searchable(text: $searchText)
        }
        .environmentObject(vm.socketManager)   /// this socket manager is used on city detail to add real time live traking of aiq quality of selected city.
    }
}

struct CityListsView_Previews: PreviewProvider {
    static var previews: some View {
        CityListsView(vm: CityListViewModel(socketManager: SocketManager()))
    }
}
