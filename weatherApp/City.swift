//
//  City.swift
//
//  Created by Jeremy Noh on 08/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//


import Foundation
import CoreLocation
import SwiftyJSON


struct City {
    var name: String
    var coordinates: CLLocationCoordinate2D
//    var forecast: Forecast?
    
    var temperature : Int
    var icon : String
    var summary : String
    var windBearing : Int
    var pressure : Int
    var humidity : Int
    var uvIndex : Int
    var hourlySummary  : String
    var dailySummary  : String
    var hours: [(Float, String,Float ,Float )]
    var daysForescast: [(Int, String,Int ,Int )]
    var hoursForescast: [(Int, String,Int )]


    
    init(name: String, coordinates: CLLocationCoordinate2D) {
        self.name = name
        self.coordinates = coordinates
        //var update
        self.temperature = 0
        self.icon = ""
        self.summary  = ""
        self.windBearing = 0
        self.pressure = 0
        self.humidity = 0
        self.uvIndex = 0
        self.hourlySummary  = ""
        self.dailySummary  = ""
        self.hours  = []
        self.daysForescast  = []
        self.hoursForescast = []
    }
    
    mutating func update(json: JSON) {
        self.temperature = json["currently"]["temperature"].intValue
        self.icon = json["currently"]["icon"].stringValue
        self.summary = json["currently"]["summary"].stringValue
        self.windBearing = json["currently"]["windBearing"].intValue
        self.pressure = json["currently"]["pressure"].intValue
        self.humidity = json["currently"]["humidity"].intValue
        self.uvIndex = json["currently"]["uvIndex"].intValue
        self.hourlySummary = json["hourly"]["summary"].stringValue
        self.dailySummary = json["daily"]["summary"].stringValue
        
        for index in json["daily"]["data"].arrayValue {
            let day = index["time"].intValue
            let icon = index["icon"].stringValue
            let temperatureLow = index["temperatureLow"].intValue
            let temperatureHigh = index["temperatureHigh"].intValue
                let tuple = (day, icon ,temperatureLow ,temperatureHigh )
                self.daysForescast.append(tuple)
        }
        
        for indexHours in json["hourly"]["data"].arrayValue {
            let hours = indexHours["time"].intValue
            let icon = indexHours["icon"].stringValue
            let temperature = indexHours["temperature"].intValue
            let tuple = (hours, icon ,temperature )
            self.hoursForescast.append(tuple)
        }
        
    }
}


