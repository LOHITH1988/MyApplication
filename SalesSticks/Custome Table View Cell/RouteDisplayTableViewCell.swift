//
//  RouteDisplayTableViewCell.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/9/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class RouteDisplayTableViewCell: UITableViewCell {

    @IBOutlet var routeLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var lineView : UIView!
    @IBOutlet var indecatorImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        lineView.backgroundColor = UIColor.app_blue_1
        StyleSheet.applyDataNameStyle(label : routeLabel , size: 18.0)
        StyleSheet.applyshortLabelStyle(label : addressLabel , size: 14.0)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
