//
//  Interest.swift
//  FirstProject
//
//  Created by MacBook on 17.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit

class Interest {
    
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage : UIImage!   
    
    init(title: String, description: String, featuredImage: UIImage!) {
        
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    static func createInterests() -> [Interest] {
        
        return [
        
            Interest(title: "0sss", description: "0sss", featuredImage: UIImage(named: "0sss")!),
            Interest(title: "0v-", description: "0v-", featuredImage: UIImage(named: "0v-0")!),
            Interest(title: "0v+", description: "0v+", featuredImage: UIImage(named: "0v+")!),
            Interest(title: "1sss", description: "1sss", featuredImage: UIImage(named: "1sss")!),
            Interest(title: "1v-", description: "1v-", featuredImage: UIImage(named: "1v-0")!),
            Interest(title: "1v+", description: "1v+", featuredImage: UIImage(named: "1v+")!),
            Interest(title: "2sss", description: "2sss", featuredImage: UIImage(named: "2sss")!),
            Interest(title: "2v-", description: "2v-", featuredImage: UIImage(named: "2v-0")!),
            Interest(title: "2v+", description: "2v+", featuredImage: UIImage(named: "2v+")!),
            Interest(title: "3sss", description: "3sss", featuredImage: UIImage(named: "3sss")!),
            Interest(title: "3v-", description: "3v-", featuredImage: UIImage(named: "3v-0")!),
            Interest(title: "3v+", description: "3v+", featuredImage: UIImage(named: "3v+")!),
            Interest(title: "4sss", description: "4sss", featuredImage: UIImage(named: "4sss")!),
            Interest(title: "4v-", description: "4v-", featuredImage: UIImage(named: "4v-0")!),
            Interest(title: "4v+", description: "4v+", featuredImage: UIImage(named: "4v+")!),
            Interest(title: "5sss", description: "5sss", featuredImage: UIImage(named: "5sss")!),
            Interest(title: "5v-", description: "5v-", featuredImage: UIImage(named: "5v-0")!),
            Interest(title: "5v+", description: "5v+", featuredImage: UIImage(named: "5v+")!),
            Interest(title: "6sss", description: "6sss", featuredImage: UIImage(named: "6sss")!),
            Interest(title: "6v-", description: "6v-", featuredImage: UIImage(named: "6v-0")!),
            Interest(title: "6v+", description: "6v+", featuredImage: UIImage(named: "6v+")!),
            Interest(title: "7sss", description: "7sss", featuredImage: UIImage(named: "7sss")!),
            Interest(title: "7v-", description: "7v-", featuredImage: UIImage(named: "7v-0")!),
            Interest(title: "7v+", description: "7v+", featuredImage: UIImage(named: "7v+")!),
            Interest(title: "8sss", description: "8sss", featuredImage: UIImage(named: "8sss")!),
            Interest(title: "8v-", description: "8v-", featuredImage: UIImage(named: "8v-0")!),
            Interest(title: "8v+", description: "8v+", featuredImage: UIImage(named: "8v+")!),
            Interest(title: "9sss", description: "9sss", featuredImage: UIImage(named: "9sss")!),
            Interest(title: "9v-", description: "9v-", featuredImage: UIImage(named: "9v-0")!),
            Interest(title: "9v+", description: "9v+", featuredImage: UIImage(named: "9v+")!)
        
        ]
    }
}
