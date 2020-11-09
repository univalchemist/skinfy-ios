//
//  ProfileTableViewCell.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var btnIcon: UIButton!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var switchCustom: SwitchCustom!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
