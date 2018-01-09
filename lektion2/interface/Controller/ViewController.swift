//
//  ViewController.swift
//  interface
//
//  Created by Rahim Siahpoosh on 2018-01-09.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var utText: UILabel!
    
    @IBOutlet weak var zoomSlider: UISlider!
    
    @IBOutlet weak var zoomProgress: UIProgressView!
    
    @IBOutlet weak var inMatning: UITextField!
    
    @IBOutlet weak var bildVy: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tryckKnapp(_ sender: UIButton) {
        
        //Test köra en if sats istället
        switch sender.tag {
        case 1:
            bildVy.image = UIImage (named: "zoomin")
            print("changed to zoomin")
            
        case 2:
            utText.text = String(5*zoomSlider.value)
            
        default:
            utText.text = "ingenting ralle"
        }
        
//        utText.text = "Tryckt på knappen"
//        print("knapp")
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        utText.text = String(sender.value)
        zoomProgress.progress = sender.value/10
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        self.view.transform = CGAffineTransform(translationX: 0, y: -200)
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        UIView.commitAnimations()
        textField.resignFirstResponder()
        return true
    }
}

