//
//  MenuTableViewCell.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

protocol MenuTableViewCellDelegate {
    func cellTapped(cell : MenuTableViewCell)
}

class MenuTableViewCell: UITableViewCell {
    
    var menuTableViewCellDelegate : MenuTableViewCellDelegate!

    @IBOutlet weak var moreButton: ExpandCellButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func moreButtonTapped(sender: AnyObject) {
        if let delegate = menuTableViewCellDelegate {
            delegate.cellTapped(self)
        }

    }
}
