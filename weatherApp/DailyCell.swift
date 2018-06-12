//
//  DailyCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 12/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperatureLow: UILabel!
    @IBOutlet weak var temperatureHigh: UILabel!
    
    
    func configure(_ daysForescast: (Int, String,Int ,Int )) {
        day.text = "\(daysForescast.0)"
        icon.image = UIImage(named: "\(daysForescast.1)")
        temperatureLow.text = "\(daysForescast.2)°C"
        temperatureHigh.text = "\(daysForescast.3)°C"
    }
}


