//
//  UIViewExtensions.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/19/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//
import UIKit

extension UIView {
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
