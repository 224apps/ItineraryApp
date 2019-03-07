//
//  AppUIButton.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/7/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.backgroundColor = Theme.tintColor?.cgColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(.white, for: .normal)
        
    }

}
