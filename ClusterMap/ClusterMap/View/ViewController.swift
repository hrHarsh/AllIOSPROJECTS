//
//  ViewController.swift
//  ClusterMap
//
//  Created by Appinventiv on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    //MARK:- Outlets -
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- Variables -
    private var service: RapperService?
    private let regionRadius: CLLocationDistance = 1500
    private var initialDistance = CLLocation(latitude:51.767,longitude:0.087)
    
    //MARK:- View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let service = service else{ fatalError("Service should have been injected before the view loads.") }
        fetchRappers(with: service)
          mapView.register(BattleRapperView.self,forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
//        mapView.register(BattleRapperClusterView.self,forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
    }
    func centreMap(on location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        centreMap(on: initialDistance)
    }


}

//MARK:- Injection -
extension ViewController{
    func inject(service: RapperService){
        self.service = service
    }
}

//MARK:- Map MAnagement -
extension ViewController{
    func fetchRappers(with service: RapperService){
        service.allBattleRappers{[weak mapView] rappers,error in
            guard error == nil else {
                print("Error fetching Rappers :\(String(describing: error))")
                return
            }
            DispatchQueue.main.async{
                self.mapView.addAnnotations(rappers)
            }
        }
    }
}

extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier) as? BattleRapperView {
            
            
            return annotation
        }
        
        return nil
    }
}
