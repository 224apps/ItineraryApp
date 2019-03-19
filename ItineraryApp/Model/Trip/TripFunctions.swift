//
//  TripFunctions.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class TripFunctions {
    
    static func  createTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
        
    }
    
    static func readTrips(completion:@escaping ()->() ){
        
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func readTrips(by id: UUID, completion:@escaping (TripModel?)->() ){
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip =  Data.tripModels.first(where : { $0.id == id } )
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage?){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    static func deleteTrip(indexPath: Int){
        
    }
}
