//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

struct TripModel {
    var id: UUID
    var title:String!
    var image: UIImage?
    var  dayModels = [DayModel]()
    
    init(title:String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
             self.dayModels = dayModels
        }
    }
}
