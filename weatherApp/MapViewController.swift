//
//  MapViewController.swift
//  weatherApp
//
//  Created by Jeremy Noh on 11/06/2018.
//  Copyright © 2018 Jeremy Noh. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var city : City?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        
        for coordinate in CitiesData.list {
            let pin = MKPointAnnotation()
            pin .coordinate = coordinate.coordinates
            pin.title = coordinate.name
            mapView.addAnnotation(pin)
            
        }

        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        print(view.annotation?.coordinate)
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
        }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
