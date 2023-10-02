// 
//  LocationMapView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.05.2023.
//

import UIKit
import MapKit

protocol LocationMapViewProtocol: AnyObject {
    
}

final class LocationMapView: UIView {
    var mapView: MKMapView!
    
    weak var delegate: LocationMapViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationMapView {
    private func setupUI() {
        mapView = MKMapView(frame: bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(mapView)
        
        
        let mapRect = MKMapRect.world
        mapView.setVisibleMapRect(mapRect, animated: false)
        
    }
}
