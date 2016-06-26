//
//  ViewController.swift
//  FirstProject
//
//  Created by MacBook on 10.10.15.
//  Copyright © 2015 MacBook. All rights reserved.
//

import UIKit

protocol SelectImage {
    func selectImage(image: UIImage)
}

class ViewController: UIViewController, UINavigationControllerDelegate, SelectImage {

    
    @IBOutlet var theLabel2: UILabel!
    
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        UIApplication.sharedApplication().keyWindow!.endEditing(true)
       
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func calculating(image: UIImage) {
        
        //(sender as! UIButton).backgroundImageForState(UIControlState.Normal)!)

        
        let matrix :[[Int8]] = imageToMatrix(image)
        var probility : Float = 0.0
        var index : Int8 = 0
        var i : Int8 = 0
        
        for machine in helpStruct.machines {
            
            let newX : [[Int8]] = machine.samplingSegment(matrix)
            
            let help = machine.recognise(matrix, newX: newX)
            
            if help > probility {
                probility = help
                index = i
            }
            
            i = i + 1
        }
        
        helpStruct.recognizedImage = UIImage(named: String(index)+"ss.png")!
        
        helpStruct.probility = String(probility)
        
    }
    
    func selectImage(image: UIImage) {
        
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        activityIndicator.startAnimating()
        dispatch_async(backgroundQueue, { [unowned self] in
            print("This is run on the background queue")
            self.calculating(image)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.activityIndicator.stopAnimating()
                self.theLabel2.text = helpStruct.probility
                self.imageView.image = helpStruct.recognizedImage
                
//                NSNotificationCenter.defaultCenter().postNotificationName("OperationDidEnd", object: nil, userInfo: nil)
//                print("This is run on the main queue, after the previous code in outer block")
            })
            })

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ChooseCTR {
            controller.delegate = self
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        NSNotificationCenter.defaultCenter().addObserver(
//            self,
//            selector: #selector(showResults),
//            name: "OperationDidEnd",
//            object: nil)
        
        if !helpStruct.startWas {
            
            for var i = 0; i<10; i++
            {
                helpStruct.machines[i] = RestrictedBoltzmanMachine(xVisible: 20, yVisible: 38, xHidden: 20, yHidden: 38)
            }
            
            readParametres(helpStruct.machines[0], indexOfFile: 0)
            readParametres(helpStruct.machines[1], indexOfFile: 1)
            readParametres(helpStruct.machines[2], indexOfFile: 2)
            readParametres(helpStruct.machines[3], indexOfFile: 3)
            readParametres(helpStruct.machines[4], indexOfFile: 4)
            readParametres(helpStruct.machines[5], indexOfFile: 5)
            readParametres(helpStruct.machines[6], indexOfFile: 6)
            readParametres(helpStruct.machines[7], indexOfFile: 7)
            readParametres(helpStruct.machines[8], indexOfFile: 8)
            readParametres(helpStruct.machines[9], indexOfFile: 9)
            
            helpStruct.startWas = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

