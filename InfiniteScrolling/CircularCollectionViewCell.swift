//
//  CircularCollectionViewCell.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

class CircularCollectionViewCell: UICollectionViewCell {
        
    func configureWith(image:String){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        imageView.image = UIImage(named: image)
        self.addSubview(imageView)
    }

}
