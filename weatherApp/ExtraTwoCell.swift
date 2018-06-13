//
//  ExtraTwoCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 13/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class ExtraTwoCell: UITableViewCell {
    
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var uvIndex: UILabel!
    
    func configure(_ city: City ) {
        pressure.text =  "\(city.pressure) hPa"
        uvIndex.text = "\(city.uvIndex)"
        
    }
    
}
