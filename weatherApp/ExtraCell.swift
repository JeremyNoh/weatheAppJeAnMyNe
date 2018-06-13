//
//  ExtraCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 13/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class ExtraCell: UITableViewCell {

    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windspeed: UILabel!
    
    func configure(_ city: City ) {
        humidity.text =  "\(city.humidity)%"
        windspeed.text = "\(city.windSpeed) km/h"
        
    }
    
}
