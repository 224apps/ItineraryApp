//
//  PopUIView.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/7/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class PopUIView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 16.0
        backgroundColor = Theme.background
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
