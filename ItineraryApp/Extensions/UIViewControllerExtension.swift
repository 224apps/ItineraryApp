//
//  UIViewControllerExtension.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/19/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//
import UIKit

extension UIViewController {
    
    /**
     Just returns the initial view controller on a storyboard
     */
    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
