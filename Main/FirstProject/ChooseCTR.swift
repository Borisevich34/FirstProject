//
//  ChooseCTR.swift
//  FirstProject
//
//  Created by MacBook on 17.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit

class ChooseCTR: UIViewController {

    var delegate: SelectImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    private var interests = Interest.createInterests()

    

}

extension ChooseCTR: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        delegate?.selectImage(interests[indexPath.item].featuredImage)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}

extension ChooseCTR : UICollectionViewDataSource {
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
    }
}