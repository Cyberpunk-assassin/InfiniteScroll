//
//  ExpandCellButton.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

class ExpandCellButton: UIButton {

    // Images
    let upButtonImage = UIImage(named: "up")! as UIImage
    let downButtonImage = UIImage(named: "down")! as UIImage
    
    // Bool property
    var isClicked: Bool = false {
        didSet{
            if isClicked == true {
                self.setImage(upButtonImage, forState: .Normal)
            } else {
                self.setImage(downButtonImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(ExpandCellButton.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isClicked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            if isClicked == true {
                isClicked = false
            } else {
                isClicked = true
            }
        }
    }

}
