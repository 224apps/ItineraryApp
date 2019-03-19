//
//  HeaderTableViewCell.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/19/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    
    func setUp(model: DayModel)  {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
