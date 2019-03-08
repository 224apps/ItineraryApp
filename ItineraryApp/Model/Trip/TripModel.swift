//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class tripModel {
    var id: UUID
    var title:String!
    var image: UIImage?
    
    init(title:String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
    }
}
