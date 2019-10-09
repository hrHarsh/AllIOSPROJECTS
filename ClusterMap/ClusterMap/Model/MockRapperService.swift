//
//  MockRapperService.swift
//  ClusterMap
//
//  Created by Appinventiv on 04/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

final class MockRapperService: RapperService{
    func allBattleRappers(completion: ([BattleRapper], Error?) -> ()) {
        guard let url = Bundle(for: type(of: self)).url(forResource: "rappers", withExtension: "json") else{ fatalError("Couldn't find json")}
        do{
            let rappersData = try Data(contentsOf: url)
            let rappers = try JSONDecoder().decode([BattleRapper].self, from: rappersData)
            completion(rappers,nil)
        }catch{
            completion([],error)
        }
    }
    
    
}
