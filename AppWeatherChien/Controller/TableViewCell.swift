//
//  TableViewCell.swift
//  AppWeatherChien
//
//  Created by Admin on 5/18/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lb_thu: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lb_nhietdo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
