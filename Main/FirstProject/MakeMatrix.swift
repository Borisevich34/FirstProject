//
//  ImageHandler.swift
//  FirstProject
//
//  Created by MacBook on 28.04.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit
import Foundation

func red(color: UInt32) -> UInt8 {
    return UInt8(color & 255)
}

func green(color: UInt32) -> UInt8 {
    return UInt8((color >> 8) & 255)
}

func blue(color: UInt32) -> UInt8 {
    return UInt8((color >> 16) & 255)
}

func alpha(color: UInt32) -> UInt8 {
    return UInt8((color >> 24) & 255)
}

func rgba(red red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> UInt32 {
    return UInt32(red) | (UInt32(green) << 8) | (UInt32(blue) << 16) | (UInt32(alpha) << 24)
}

func imageToMatrix(image: UIImage) -> [[Int8]] {
    
    let inputCGImage = image.CGImage
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let width = CGImageGetWidth(inputCGImage)
    let height = CGImageGetHeight(inputCGImage)
    let bytesPerPixel = 4
    let bitsPerComponent = 8
    let bytesPerRow = bytesPerPixel * width
    let bitmapInfo = CGImageAlphaInfo.PremultipliedLast.rawValue
    
    let context = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)!
    CGContextDrawImage(context, CGRectMake(0, 0, CGFloat(width), CGFloat(height)), inputCGImage)
    
    let pixelBuffer = UnsafeMutablePointer<UInt32>(CGBitmapContextGetData(context))
    
    var currentPixel = pixelBuffer
    
    var matrixOfNumbers:[[Int8]]=[[Int8]](count:38, repeatedValue: [Int8](count:20,repeatedValue:1))
    
    for var i = 0; i < Int(height); i++ {
        for var j = 0; j < Int(width); j++ {
            
            let pixel = currentPixel.memory
            let sum:Int = Int(red(pixel))+Int(green(pixel))+Int(blue(pixel))
            
            if sum<=690 {//384 было, это середина
                matrixOfNumbers[i][j] = 1
            }
            else {
                matrixOfNumbers[i][j] = 0
            }
            currentPixel++
        }
    }
    return matrixOfNumbers
}
