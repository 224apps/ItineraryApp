//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import Foundation

class tripModel {
    var id: String!
    var title:String!
    
    init(title:String) {
        id = UUID().uuidString
        self.title = title
    }
}
