//
//  SelectLocationViewController.swift
//  att-hack
//
//  Created by Cameron Moreau on 8/20/16.
//  Copyright © 2016 Kolten. All rights reserved.
//

import UIKit
import Mapbox

protocol SelectLocationDelegate {
    func locationSelected(coord: CLLocationCoordinate2D, zoom: Double)
}

class SelectLocationViewController: UIViewController, MGLMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MGLMapView!
    
    
    
    var delegate: SelectLocationDelegate?
    
    var startZoom: Double?
    var startLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        if let loc = startLocation {
            mapView.centerCoordinate = loc
        }
        
        if let zoom = startZoom {
            mapView.zoomLevel = zoom
        }
    }
    
    func mapView(mapView: MGLMapView, regionDidChangeAnimated animated: Bool) {
        delegate?.locationSelected(mapView.centerCoordinate, zoom: mapView.zoomLevel)
    }

}
