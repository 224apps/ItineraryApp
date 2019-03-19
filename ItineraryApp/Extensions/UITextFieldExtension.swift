//
//  UITextFieldExtension.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/19/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

extension UITextField {
    var hasValue: Bool {
        guard text == "" else { return true }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.image = #imageLiteral(resourceName: "Warning")
        imageView.contentMode = .scaleAspectFit
        
        rightView = imageView
        rightViewMode = .unlessEditing
        
        return false
    }
}
