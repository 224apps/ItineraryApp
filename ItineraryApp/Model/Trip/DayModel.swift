//
//  DayModel.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/18/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import Foundation

struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title:String, subtitle:String, data:[ ActivityModel]?) {
        
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data {
            self.activityModels = data
        }
    }
}
