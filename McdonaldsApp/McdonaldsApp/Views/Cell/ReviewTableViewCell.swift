//
//  ReviewTableViewCell.swift
//  McdonaldsApp
//
//  Created by ульяна on 15.12.22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfFeedback: UILabel!
    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var ratingOfProduct: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
