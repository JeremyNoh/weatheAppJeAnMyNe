//
//  Forecast.swift
//  weatherApp
//
//  Created by Jeremy Noh on 11/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftyJSON


struct Forecast {
    var temperature : Float
    var icon : String
    var summary : String
    var windBearing : Int
    var pressure : Int
    var humidity : Int
    var uvIndex : Int
    var hourlySummary  : String
    var dailySummary  : String
    
    
    init(json: JSON ) {
//        print(self.humidity)
        self.temperature = json["currently"]["temperature"].floatValue
        self.icon = json["currently"]["icon"].stringValue
        self.summary = json["currently"]["summary"].stringValue
        self.windBearing = json["currently"]["windBearing"].intValue
        self.pressure = json["currently"]["pressure"].intValue
        self.humidity = (json["currently"]["humidity"].intValue)*100
        self.uvIndex = json["currently"]["uvIndex"].intValue
        self.hourlySummary = json["hourly"]["summary"].stringValue
        self.dailySummary = json["daily"]["summary"].stringValue
    }
}
