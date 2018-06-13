//
//  menuCell.swift
//  weatherApp
//
//  Created by Jeremy Noh on 13/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit

class menuCell: UITableViewCell {

    @IBOutlet weak var CityName: UILabel!
    
    func configure(_ city: City ) {
        CityName.text = "\(city.name)"
    }
    
}
