//
//  HoursCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 12/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class HoursCell: UITableViewCell {
    
    
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    
    func configure(_ hoursForescast: (Int, String,Int )) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(hoursForescast.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let strDate = dateFormatter.string(from: date)
        
        hours.text = "\(strDate)"
        icon.image = UIImage(named: "\(hoursForescast.1)")
        temperature.text = "\(hoursForescast.2)°C"
    }
    
}
