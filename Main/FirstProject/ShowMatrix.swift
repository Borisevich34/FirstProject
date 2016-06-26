//
//  ShowMatrix.swift
//  FirstProject
//
//  Created by MacBook on 28.04.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import Foundation
import UIKit

func matrixToImage(matrix: [[Int8]]) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: matrix[0].count, height: matrix.count), true, 1)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let width = matrix[0].count
    let height = matrix.count
    let bytesPerPixel = 4
    let bitsPerComponent = 8
    let bytesPerRow = bytesPerPixel * width
    let bitmapInfo = CGImageAlphaInfo.PremultipliedLast.rawValue
    
    let context = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)!
    CGContextDrawImage(context, CGRectMake(0, 0, CGFloat(width), CGFloat(height)), image.CGImage)
    
    let pixelBuffer = UnsafeMutablePointer<UInt32>(CGBitmapContextGetData(context))
    
    var currentPixel = pixelBuffer //
    
    for var i = 0; i < matrix.count; i++ {
        for var j = 0; j < matrix[0].count; j++ {
            
            if (matrix[i][j] == 1) {
                currentPixel.memory = rgba(red: 0, green: 0, blue: 0, alpha: 255)
            }
            else {
                currentPixel.memory = rgba(red: 255, green: 255, blue: 255, alpha: 255)
            }
            currentPixel++ //
        }
    }
    
    let outputCGImage = CGBitmapContextCreateImage(context)
    let outputImage = UIImage(CGImage: outputCGImage!, scale: image.scale, orientation: image.imageOrientation)
    
    return outputImage
    
    
}