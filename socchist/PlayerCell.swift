//
//  PlayerCell.swift
//  socchist
//
//  Created by Sakhavat Suleymanli on 10/25/18.
//  Copyright © 2018 sakhapps. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var playerImageImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
