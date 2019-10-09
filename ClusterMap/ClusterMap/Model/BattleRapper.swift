//
//  BattleRapper.swift
//  ClusterMap
//
//  Created by Appinventiv on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import MapKit

final class BattleRapper:NSObject,MKAnnotation,Codable {
    let name: String
    let favouriteArtist: String
    let coordinate: CLLocationCoordinate2D
    public var title: String? { return name }
    public var subtitle: String? { return "🔥 " + favouriteArtist + " 🔥"}
    
//MARK:- Initializers -
    public init(name: String,favouriteArtist: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.favouriteArtist = favouriteArtist
        self.coordinate = coordinate
    }
}

//  MARK: CLLocationCoordinate2D + Codable
extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(latitude)
        try container.encode(longitude)
    }
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.init()
        latitude = try container.decode(Double.self)
        longitude = try container.decode(Double.self)
    }
}
