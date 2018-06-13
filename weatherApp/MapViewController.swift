//
//  MapViewController.swift
//  weatherApp
//
//  Created by Jeremy Noh on 11/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var sideBarContrainte: NSLayoutConstraint!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    var city : City?
    
    var sideBarHide = true
    var cities: [City] = CitiesData.list
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         sideBarContrainte.constant = -200
        mapView.delegate = self
        tableView.dataSource = self
        
        for coordinate in CitiesData.list {
            let pin = MKPointAnnotation()
            pin .coordinate = coordinate.coordinates
            pin.title = coordinate.name
            mapView.addAnnotation(pin)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
        cell.configure(cities[indexPath.row])
        return cell
    }
    
    @IBAction func sideBarPress(_ sender: Any) {
        if sideBarHide {
            sideBarContrainte.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else{
            sideBarContrainte.constant = -200
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        sideBarHide = !sideBarHide
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        city = City(name: ((view.annotation?.title)!)!, coordinates: (view.annotation?.coordinate)!)
        performSegue(withIdentifier: "idSegue", sender: self )
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idSegue"{
            if let vc = segue.destination as? DetailViewController
            {
                vc.city = city
            }
        }
        if segue.identifier == "cellSegue"{
            if let vc = segue.destination as? DetailViewController , let index = tableView.indexPathForSelectedRow?.row
            {
                vc.city = cities[index]
                sideBarContrainte.constant = -200
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
