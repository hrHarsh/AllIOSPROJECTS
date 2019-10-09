//
//  BattleRapperView.swift
//  ClusterMap
//
//  Created by Appinventiv on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import UIKit
import MapKit

internal final class BattleRapperView: MKMarkerAnnotationView {
    //  MARK:- Properties-
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }

}
//  MARK:- Configuration-
private extension BattleRapperView {
    func configure(with annotation: MKAnnotation) {
        guard annotation is BattleRapper else { fatalError("Unexpected annotation type: \(annotation)") }
        markerTintColor = .purple
        glyphText = "💣"
        
    }
    
}
