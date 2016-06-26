//
//  HelpStruct.swift
//  FirstProject
//
//  Created by MacBook on 19.05.16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit

struct helpStruct {
    
    static var machines : [RestrictedBoltzmanMachine] = [RestrictedBoltzmanMachine](count:10, repeatedValue: RestrictedBoltzmanMachine(xVisible: 20, yVisible: 38, xHidden: 20, yHidden: 38))
    
    static var recognizedImage : UIImage = UIImage(named: "Image")!
    static var startWas : Bool = false
    
    static var probility : String = ""
}