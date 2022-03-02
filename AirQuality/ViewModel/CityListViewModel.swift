//
//  CityListViewModel.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 28/02/22.
//

import Foundation

class CityListViewModel : ObservableObject {
    /// list of unique city models with updated information on latest data from server.
    @Published var cities:[CityModel] = []
    
    /// socket manager
    var socketManager:SocketManager
    /// init with socket manager and start subscription
    init(socketManager:SocketManager) {
        self.socketManager  = socketManager
        self.socketManager.startSubscription()
        /// set delegate to receive city data over time.
        self.socketManager.delegate = self
    }
}

extension CityListViewModel: SocketManagerDelegate {
    /// city data last updated
    func didReceive(cityJsonObjects: [CityJson]) {
        /// the received cityJsonObjects is looped and checked for if the city name is already exits,
        /// if the city is already availabe in the cities array, update its value
        /// else insert new city data.
        cityJsonObjects.forEach { cityJson in
            
            /// find the match
            let matchingCity =  self.cities.filter {  $0.city == cityJson.city }.first
            /// if exits, update with latest information
            if let existing = matchingCity {
                existing.aqi = cityJson.aqi
                existing.date = Date()
                /// notify subscriber about the chenage
                self.objectWillChange.send()
            } else {
                /// add new city to cities.
                self.cities.append(CityModel(city: cityJson.city, aqi: cityJson.aqi))
            }
        }
    }
}
