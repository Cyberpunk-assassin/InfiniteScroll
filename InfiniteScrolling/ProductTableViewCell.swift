//
//  ProductTableViewCell.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var tiltleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureWith(imageName:String,thumbnailName:String,title:String,desc:String){
        self.productImageView.image = UIImage(named: imageName)
        self.thumbnailImageView.image = UIImage(named: thumbnailName)
        self.tiltleLabel.text = title
        self.descLabel.text = desc
        
    }


}
