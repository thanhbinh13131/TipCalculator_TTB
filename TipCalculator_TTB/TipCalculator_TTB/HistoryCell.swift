//
//  HistoryCell.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var historyDate: UILabel!
    
    @IBOutlet weak var historyTotal: UILabel!
    @IBOutlet weak var historyTip: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
