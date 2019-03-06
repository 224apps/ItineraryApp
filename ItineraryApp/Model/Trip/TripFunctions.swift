//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import Foundation

class TripFunctions {
    
    static func  createTrip(tripModel: tripModel){
        
    }
    
    static func readTrips(completion:@escaping ()->() ){
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(tripModel(title: "Trip to Bali!"))
                Data.tripModels.append(tripModel(title: "Trip to Mexico!"))
                Data.tripModels.append(tripModel(title: "Trip to Russia!"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
       
        
    }
    static func updateTrip(tripModel: tripModel){
        
    }
    static func deleteTrip(tripModel:tripModel){
        
    }
}
