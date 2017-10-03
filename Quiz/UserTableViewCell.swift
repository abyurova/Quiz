//
//  UserTableViewCell.swift
//  Quiz
//
//  Created by Ainur on 9/19/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var userVariantLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
