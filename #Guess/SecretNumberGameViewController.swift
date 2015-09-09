//
//  FirstViewController.swift
//  #Guess
//
//  Created by Seth Rininger on 9/8/15.
//  Copyright (c) 2015 Seth Rininger. All rights reserved.
//

import UIKit

class SecretNumberGameViewController: UIViewController {

    var numberToGuess = Int(arc4random_uniform(100)) + 1
    
    @IBOutlet weak var GuessBox: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var LowerImage: UIImageView!
    @IBOutlet weak var HigherImage: UIImageView!
    @IBOutlet weak var JustRightImage: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 5
        LowerImage.hidden = true
        HigherImage.hidden = true
        JustRightImage.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okButtonPressed(sender: AnyObject) {

        if let  number = GuessBox.text.toInt() {
            if number > numberToGuess{
                LowerImage.hidden = false
                HigherImage.hidden = true
                JustRightImage.hidden = true
            } else if number < numberToGuess {
                LowerImage.hidden = true
                HigherImage.hidden = false
                JustRightImage.hidden = true
            } else {
                LowerImage.hidden = true
                HigherImage.hidden = true
                JustRightImage.hidden = false
            }
        }
    }

    @IBAction func resetButtonPressed(sender: AnyObject) {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        LowerImage.hidden = true
        HigherImage.hidden = true
        JustRightImage.hidden = true
    }
    
    @IBAction func guessBoxDidBeginEditing(sender: AnyObject) {
        GuessBox.text = ""
    }

}

