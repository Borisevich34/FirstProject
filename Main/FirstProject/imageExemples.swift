//
//  imageExemoles.swift
//  FirstProject
//
//  Created by MacBook on 02.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit
import Foundation

func justDoIt(machines : [RestrictedBoltzmanMachine]) {
    
    var exemples : [[UIImage]] = [[UIImage]](count:10, repeatedValue:[UIImage](count:7,
        repeatedValue: UIImage()))
    
    var matrixesOfExemples:[[[Int8]]]=[[[Int8]]](count:7, repeatedValue:[[Int8]](count:38,
        repeatedValue: [Int8](count:20,repeatedValue:1)))
    
    for var i = 0; i < 10; i++ {
        
        exemples[i] =
        
        [UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/horizontal-10/"+String(i)+"h-.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/horizontal+10/"+String(i)+"h+.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/vertical-10/"+String(i)+"v-.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/vertical+10/"+String(i)+"v+.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/left+10/"+String(i)+"l+.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/right+10/"+String(i)+"r+.png")!,
        UIImage(named: "/Users/macbook/Desktop/imageOfNumbers/single sized/"+String(i)+"ss.png")!]
        
        for var j = 0; j < 7; j++ {
            
            let help = imageToMatrix(exemples[i][j])
            
            for var k = 0; k < 38; k++ {
                for var l = 0; l < 20; l++ {
                    
                    matrixesOfExemples[j][k][l] = help[k][l]
                }
            }
        }
        
        machines[i].setArrayOfExamples(matrixesOfExemples)
        
    }
    
}