//
//  HeaderCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 11/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    
//    func configure(_ cities: City , forecast : Forecast) {
//        temperature.text = cities.name
//    }
    
    func configure(_ city: City ) {
        icon.image = UIImage(named: "\(city.icon)")
        temperature.text = "\(city.temperature)"
        summary.text = city.summary
    }
    


}

