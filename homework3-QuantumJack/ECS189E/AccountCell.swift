//
//  AccountCell.swift
//  ECS189E
//
//  Created by Jack Feng on 11/6/18.
//  Copyright © 2018 Zhiyi Xu. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    @IBOutlet weak var leftLabel: UILabel!

    @IBOutlet weak var rightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
