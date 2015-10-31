//
//  HelloViewController.swift
//  helloWorld
//
//  Created by alice on 10/31/15.
//  Copyright © 2015 alice. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    
    var helloLabel: UILabel! = UILabel()
    var hiButton: UIButton! = UIButton()
    var byeButton: UIButton! = UIButton()
   // var helloLabel1: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do your code here!
        
        self.view.backgroundColor = UIColor.grayColor()
        
        helloLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
        helloLabel.text = "Hello world"
        helloLabel.backgroundColor = UIColor.blueColor()
        self.view.addSubview(helloLabel)
        
//        helloLabel1 = UILabel()
//        helloLabel1.frame = CGRectMake(20, 80, 200, 60)
//        helloLabel1.backgroundColor = UIColor.purpleColor()
//        helloLabel1.text = "Hello Earth"
//        self.view.addSubview(helloLabel1)
    
        hiButton = UIButton(frame: CGRect(x: 20, y: 100, width: 50, height: 50))
        hiButton.setTitle("Hi", forState: UIControlState.Normal)
        self.view.addSubview(hiButton)
        
        byeButton = UIButton()
        byeButton.frame = CGRectMake(CGRectGetMaxX(hiButton.frame), hiButton.frame.origin.y, 50, 50)
        //byeButton.frame = CGRectMake(hiButton.frame.origin.x + hiButton.frame.size.width + 10, hiButton.frame.origin.y, 50, 50)
        byeButton.addTarget(self, action: "pressed:eventreq:", forControlEvents: UIControlEvents.TouchUpInside)
        byeButton.setTitle("Bye", forState: UIControlState.Normal)
        
        self.view.addSubview(byeButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pressed(sender:AnyObject?, eventreq: UIEvent){
        if let button = sender as? UIButton{
            if button == byeButton{
                NSLog("Bye button is clicked")
            }
            
        }
    }
    
    
}
