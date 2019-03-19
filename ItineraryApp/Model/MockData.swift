//
//  MockData.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/18/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import Foundation

class MockData {
    
    static func createMockTripModelData() ->[TripModel] {
        var mockTrips =  [TripModel]()
        mockTrips.append(TripModel(title: "Trip to Bali!", image: #imageLiteral(resourceName: <#T##String#>), dayModels: createMockDayModelData()))
        mockTrips.append(TripModel(title: "Trip to Mexico!", image: #imageLiteral(resourceName: <#T##String#>)))
        mockTrips.append(TripModel(title: "Trip to Russia!"))
        return mockTrips
    }
    
    static func createMockDayModelModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        dayModels.append(DayModel(title: "January 18", subtitle: "Departure", data: createMockActivityModelData(sectionTitle: "January 18")))
         dayModels.append(DayModel(title: "January 21", subtitle: "Scuba Diving", data: createMockActivityModelData(sectionTitle: "January 21")))
         dayModels.append(DayModel(title: "February 10", subtitle: "Volunteering", data: createMockActivityModelData(sectionTitle: "February 10")))
        return dayModels
    }
    
    static func createMockActivityModelData(sectionTitle: String) {
        
    }
}
