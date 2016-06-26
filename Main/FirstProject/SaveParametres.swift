//
//  SaveParametres.swift
//  FirstProject
//
//  Created by MacBook on 08.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import Foundation

func saveParametres(machine : RestrictedBoltzmanMachine, indexOfFile : Int8) {
    
    var textFirst = ""
    var textSecond = ""
    var textThird = ""

    for var i = 0; i < 38; i++ {
        for var j = 0; j < 20; j++ {
            textFirst += String(machine.biasesX[i][j])
            textFirst += " "
            textSecond += String(machine.biasesY[i][j])
            textSecond += " "
            for var m = 0; m < 38; m++ {
                for var l = 0; l < 20; l++ {
                    textThird += String(machine.matrixOfWeights[i][j][m][l])
                    textThird += " "
                }
                textThird+="\n"
            }
        }
        textFirst+="\n"
        textSecond+="\n"
    }
        
    do {
        
        try (NSString(string: textFirst)).writeToFile("/Users/macbook/Desktop/Parametres/First/First"+String(indexOfFile)+".txt", atomically: false, encoding: NSUTF8StringEncoding)
        try (NSString(string: textSecond)).writeToFile("/Users/macbook/Desktop/Parametres/Second/Second"+String(indexOfFile)+".txt", atomically: false, encoding: NSUTF8StringEncoding)
        try (NSString(string: textThird)).writeToFile("/Users/macbook/Desktop/Parametres/Third/Third"+String(indexOfFile)+".txt", atomically: false, encoding: NSUTF8StringEncoding)
    }
        
    catch let error as NSError {
        print("Erroe : \(error)")
    }
    
}