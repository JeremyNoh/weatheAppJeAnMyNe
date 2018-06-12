//
//  DetailViewController.swift
//  weatherApp
//
//  Created by Jeremy Noh on 11/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var city: City?
    var forecast : [Forecast]  = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.title = city?.name
        requestWeather()
    }
    
    func requestWeather() {
        
        if let latitude = city?.coordinates.latitude, let longitude = city?.coordinates.longitude {
            Alamofire.request("https://api.darksky.net/forecast/2c3569dd422b6bceca61f9682fc0a61d/\(latitude),\(longitude)?lang=fr&units=si").responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    self.city?.update(json: json)
                    print(self.city?.daysForescast)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return city?.daysForescast.count ?? 0
        default:
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            if let city = city {
                cell.configure(city)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyCell
            if let city = city {
                cell.configure(city.daysForescast[indexPath.row])
            }
            return cell

        default:
            return UITableViewCell()
        }
    }
    

    

}
