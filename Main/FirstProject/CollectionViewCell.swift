//
//  CollectionViewCell.swift
//  FirstProject
//
//  Created by MacBook on 17.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellView: UIImageView!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        cellView.image = interest.featuredImage
        
    }
    
}
