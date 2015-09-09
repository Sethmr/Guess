//
//  FirstViewController.swift
//  #Guess
//
//  Created by Seth Rininger on 9/8/15.
//  Copyright (c) 2015 Seth Rininger. All rights reserved.
//

import UIKit

class SecretNumberGameViewController: UIViewController, UITabBarControllerDelegate {

    var numberToGuess = Int(arc4random_uniform(100)) + 1
    var numberOfTries = 0
    var victories: [Int?] = []
    
    @IBOutlet weak var GuessBox: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var LowerImage: UIImageView!
    @IBOutlet weak var HigherImage: UIImageView!
    @IBOutlet weak var JustRightImage: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var GuessLabel: UILabel!
    @IBOutlet weak var triesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.layer.cornerRadius = (0.5 * okButton.frame.size.height)
        resetButton.layer.cornerRadius = (0.5 * resetButton.frame.size.height)
        LowerImage.hidden = true
        HigherImage.hidden = true
        JustRightImage.hidden = true
        
        self.tabBarController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okButtonPressed(sender: AnyObject) {

        if let  number = GuessBox.text.toInt() {
            GuessLabel.text = String(number)
            if 0 < number && number <= 100 {
                GuessBox.text = ""
                numberOfTries++
                triesLabel.text = "Tries: \(numberOfTries)"
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
                    victories.append(numberOfTries)
                }
            } else {
                GuessLabel.text = "Outside Boundaries"
            }
        } else {
            GuessLabel.text = "Incorrect Input"
        }
    }

    @IBAction func resetButtonPressed(sender: AnyObject) {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        LowerImage.hidden = true
        HigherImage.hidden = true
        JustRightImage.hidden = true
        GuessBox.text = "Guess..."
        GuessLabel.text = "?"
        GuessBox.endEditing(true)
        numberOfTries = 0
        triesLabel.text = "Tries: \(numberOfTries)"
    }
    
    @IBAction func guessBoxDidBeginEditing(sender: AnyObject) {
        GuessBox.text = ""
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {

        victories.sort {
            return $0 < $1
        }
        
        if let htvc = viewController.childViewControllers[0] as? HighscoresTableViewController {
            htvc.highscores = victories
            htvc.tableView.reloadData()
        }
    }
    
}

