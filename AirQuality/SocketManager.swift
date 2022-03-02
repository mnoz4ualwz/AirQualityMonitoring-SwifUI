//
//  SocketManager.swift
//  AirQuality
//
//  Created by Manoj Chuarasia on 27/02/22.
//

import Foundation
import Starscream

enum SocketConfigutation {
    /// Socket url
    static let webSocketUrl = "ws://city-ws.herokuapp.com"
}

/// Socket manager protocal
protocol SocketManagerDelegate: AnyObject {
    /// city json objects
    func didReceive(cityJsonObjects:[CityJson])
}


final class SocketManager: WebSocketDelegate, ObservableObject {
    
    var isConnected = false
    /// This holds all the city updates and is used on city details screen by filtering selected city data and sorting based on date.
    @Published var cityAQIHistory = [CityAQI]()
    
    /// socket delegate
    weak var delegate:SocketManagerDelegate?
    
    /// socket instance
    private var socket: WebSocket = {
        let url     = URL(string: SocketConfigutation.webSocketUrl)!
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        
        var socket  = WebSocket(request: request)
        return socket
    }()
    
    /// start monitoring socket
    func startSubscription() {
        socket.delegate = self
        socket.connect()
    }
    
    /// stop monitoring socket.
    func stopSubscriptiong() {
        socket.disconnect()
    }
    
    /// Socket event delegate
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
            
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
            parseJsonString(text: string)
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(_):
            isConnected = false
        }
    }
    
    /// Parse the response and inform its delegate
    ///  Also store received cities information in cityAQIHistory
    func parseJsonString(text:String) {
        /// Json parsing
        let jsonData    = Data(text.utf8)
        let jsonDecoder = JSONDecoder()

        do {
            let items = try jsonDecoder.decode([CityJson].self, from: jsonData)
            /// Passing JSON objects to its delegate. Delegate convert this to CityModel for View.
            self.delegate?.didReceive(cityJsonObjects: items)
            
            /// AQi history for city details screen graph.
            self.cityAQIHistory.append(contentsOf: items.map({ cityJson in
                CityAQI(aqi: cityJson.aqi, date: Date(), city: cityJson.city)
            }))
            
        } catch {
            print(error)
        }
    }
}
