//
//  RapperService.swift
//  ClusterMap
//
//  Created by Appinventiv on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

 protocol RapperService {
    /**
    Fetches all battle rappers.
    */
    func allBattleRappers(completion: ([BattleRapper], Error?) -> ())
}
