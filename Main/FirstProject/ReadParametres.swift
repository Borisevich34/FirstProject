//
//  ReadParametres.swift
//  FirstProject
//
//  Created by MacBook on 09.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import Foundation
func readParametres(machine : RestrictedBoltzmanMachine, indexOfFile : Int8) {
    
    let pathFirst = NSBundle.mainBundle().pathForResource("First"+String(indexOfFile), ofType: ".txt")
    let pathSecond = NSBundle.mainBundle().pathForResource("Second"+String(indexOfFile), ofType: ".txt")
    let pathThird = NSBundle.mainBundle().pathForResource("Third"+String(indexOfFile), ofType: ".txt")
    
    do {
        
        
        let fullFirstText = try String(contentsOfFile: pathFirst!, encoding: NSUTF8StringEncoding)
        //let fullFirstText = try String(contentsOfFile: "/Users/macbook/Desktop/Parametres/First/First"+String(indexOfFile)+".txt", encoding: NSUTF8StringEncoding)
        let firstReadings = fullFirstText.componentsSeparatedByString("\n")
        
        
        let fullSecondText = try String(contentsOfFile: pathSecond!, encoding: NSUTF8StringEncoding)
        //let fullSecondText = try String(contentsOfFile: "/Users/macbook/Desktop/Parametres/Second/Second"+String(indexOfFile)+".txt", encoding: NSUTF8StringEncoding)
        let secondReadings = fullSecondText.componentsSeparatedByString("\n")
        
        
        let fullThirdText = try String(contentsOfFile: pathThird!, encoding: NSUTF8StringEncoding)
        //let fullThirdText = try String(contentsOfFile: "/Users/macbook/Desktop/Parametres/Third/Third"+String(indexOfFile)+".txt", encoding: NSUTF8StringEncoding)
        let thirdReadings = fullThirdText.componentsSeparatedByString("\n")

        
        for var i = 0; i < 38; i++ {
            var itemsInLine1 = firstReadings[i].componentsSeparatedByString(" ")
            var itemsInLine2 = secondReadings[i].componentsSeparatedByString(" ")
            for var j = 0; j < 20; j++ {
                
                machine.biasesX[i][j] = Float(itemsInLine1[j])!
                machine.biasesY[i][j] = Float(itemsInLine2[j])!
                
                for var m = 0; m < 38; m++ {
                    var itemsInLine3 = thirdReadings[760*i+38*j+m].componentsSeparatedByString(" ")
                    for var l = 0; l < 20; l++ {
                        machine.matrixOfWeights[i][j][m][l] = Float(itemsInLine3[l])!
                    }
                }
            }
        }
        
    }
        
    catch let error as NSError {
        print("Erroe : \(error)")
    }
}