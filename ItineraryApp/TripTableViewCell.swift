//
//  TripTableViewCell.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 16.0
    }
    
    func setup(tripModel: tripModel ){
        titleLabel.text =  tripModel.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
