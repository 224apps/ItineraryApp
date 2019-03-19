//
//  DateExtension.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/19/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import Foundation

extension Date {
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    
    func mediumDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
