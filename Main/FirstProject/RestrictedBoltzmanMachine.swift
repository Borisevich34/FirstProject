//  ClassBoltsman.swift
//  FirstProject
//
//  Created by MacBook on 19.12.15.
//  Copyright © 2015 MacBook. All rights reserved.
//

import Foundation
import UIKit

class RestrictedBoltzmanMachine {
    
    let xVisible:Int; let yVisible:Int
    
    let xHidden:Int
    let yHidden:Int
    
    var biasesX:[[Float]]
    var biasesY:[[Float]]
    var matrixOfWeights:[[[[Float]]]]

    var arrayOfSegments:[[[Int8]]]    //Предположим что будет подготовлено, когда решится проблема сигментации изображения
    var arrayOfExamples:[[[Int8]]]

    init (xVisible:Int, yVisible:Int, xHidden:Int, yHidden:Int) {
        
        self.xVisible=xVisible
        self.yVisible=yVisible
        self.xHidden=xHidden
        self.yHidden=yHidden
        
        biasesX = [[Float]](count:yVisible, repeatedValue:[Float](count:xVisible, repeatedValue:0.0))
        biasesY = [[Float]](count:yVisible, repeatedValue:[Float](count:xVisible, repeatedValue:0.0))
        
        matrixOfWeights = [[[[Float]]]](count:yVisible, repeatedValue:[[[Float]]](count:xVisible,
            repeatedValue: [[Float]](count:yHidden,repeatedValue:[Float](count:xHidden, repeatedValue:0.0))))
        
        //.............................................................................//
        
        arrayOfSegments = [[[Int8]]](count:4, repeatedValue:[[Int8]](count:yVisible,
            repeatedValue: [Int8](count:xVisible,repeatedValue:1)))
        
        arrayOfExamples = [[[Int8]]](count:7, repeatedValue:[[Int8]](count:yVisible,
            repeatedValue: [Int8](count:xVisible,repeatedValue:1)))
        
        //.............................................................................//
    }
 
    func setArrayOfSegments(arraySegments:[[[Int8]]]) {
        
        for var i = 0; i < arraySegments.count; i++ {
            for var j = 0; j < arraySegments[0].count; j++ {            //yVisible
                for var k = 0; k < arraySegments[0][0].count; k++ {     //xVisible
                    arrayOfSegments[i][j][k]=arraySegments[i][j][k]
                    
                }
            }
        }
    }
    
    func setArrayOfExamples(arrayExamples:[[[Int8]]]) {
        
        for var i = 0; i < arrayExamples.count; i++ {
            for var j = 0; j < arrayExamples[0].count; j++ {
                for var k = 0; k < arrayExamples[0][0].count; k++ {
                    arrayOfExamples[i][j][k]=arrayExamples[i][j][k]
                    
                }
            }
        }
    }
    
    func generateY(x:[[Int8]], m:Int, l:Int)->Int8 {
        
        if Float(abs(random())%100)/100.0 < probabilityHidden(x, m: m, l: l) {
            
            return 1
        }
        else {
            
            return 0   //-1
        }
    }
    
    func generateX(y:[[Int8]], i:Int, j:Int)->Int8 {
        
        if Float(abs(random())%100)/100.0 < probabilityVisible(y, i: i, j: j) {
            
            return 1
        }
        else {
            
            return 0   //-1
        }
    }
    
    func probabilityHidden (visible:[[Int8]], m:Int, l:Int)->Float {
        
        var sum:Float = biasesY[m][l]
        for var i = 0; i < yVisible; i++ {
            for var j = 0; j < xVisible; j++ {
                sum+=Float(visible[i][j])*matrixOfWeights[i][j][m][l]
            }
        }
        return 1.0/(1+exp(-sum))
    }
    
    func probabilityVisible (hidden:[[Int8]], i:Int, j:Int)->Float {
        
        var sum:Float = biasesX[i][j]
        for var k = 0; k < yHidden; k++ {
            for var l = 0; l < xHidden; l++ {
                sum+=Float(hidden[k][l])*matrixOfWeights[i][j][k][l]
            }
        }
        return 1.0/(1+exp(-sum))
    }
    
    func contrastiveDivergence (k:Int) { //сто процентво что-то неправильно!!!!! в цикле на 4-ре
        
        var first : Float
        var last : Float
        
        var newY = [[Int8]](count:yHidden, repeatedValue:[Int8](count:xHidden, repeatedValue:0))
        var newX = [[Int8]](count:yVisible, repeatedValue:[Int8](count:xVisible, repeatedValue:0))
        
        //var count : Int8 = 0
        for example in arrayOfExamples {
            
            //count += 1
            
            for var i = 0; i < yVisible; i++ {
                for var j = 0; j < xVisible; j++ {
                   newX[i][j] = example[i][j]
                }
            }
            
            for var t = 0; t < k; t++ {
                
                for var m = 0; m < yHidden; m++ {
                    for var l = 0; l < xHidden; l++ {
                        newY[m][l] = generateY(newX, m: m, l:l)
                    }
                }
                
                for var i = 0; i < yVisible; i++ {
                    for var j = 0; j < xVisible; j++ {
                        newX[i][j] = generateX(newY, i: i, j:j)
                    }
                }
                
            }
            
            for var i = 0; i < yVisible; i++ {
                //print("new I: " + String(i) + " count = " + String(count))
                for var j = 0; j < xVisible; j++ {
                    
                    //print(j)
                    biasesX[i][j] += Float(example[i][j] - newX[i][j])
                    
                    biasesY[i][j] += probabilityHidden(example, m: i, l: j) - probabilityHidden(newX, m: i, l: j)
                    
                    for var m = 0; m < yHidden; m++ {
                        for var l = 0; l < xHidden; l++ {
                            
                            first = probabilityHidden(example, m: m, l: l)
                            last = probabilityHidden(newX, m: m, l: l)
                            
                            matrixOfWeights[i][j][m][l] += first * Float(example[i][j]) - last * Float(newX[i][j])
                            
                        }
                    }
 
                }
            }
            
        }
        //print("Done!!!!")
    }
    
    func samplingSegment(segment: [[Int8]]) -> [[Int8]] {
        
        var newY = [[Int8]](count:yHidden, repeatedValue:[Int8](count:xHidden, repeatedValue:0))
        var newX = [[Int8]](count:yVisible, repeatedValue:[Int8](count:xVisible, repeatedValue:0))
        
        for var i = 0; i < yVisible; i++ {
            for var j = 0; j < xVisible; j++ {
                newX[i][j] = segment[i][j]
            }
        }
        
        for var m = 0; m < yHidden; m++ {
            for var l = 0; l < xHidden; l++ {
                newY[m][l] = generateY(newX, m: m, l:l)
            }
        }
        
        for var i = 0; i < yVisible; i++ {
            for var j = 0; j < xVisible; j++ {
                
                newX[i][j] = generateX(newY, i: i, j:j)
            }
        }
        
        return newX
        //.....................//
    }
    
    
    func recognise(oldX: [[Int8]], newX: [[Int8]]) -> Float {
        
        var sum : Int16 = 0
        
        for var i = 0; i < yVisible; i++ {
            for var j = 0; j < xVisible; j++ {

                if (newX[i][j]==oldX[i][j]) {
                    sum += 1
                }
            }
        }
        
        return Float(Float(sum)/760.0)
        //.....................//
    }

    
}















