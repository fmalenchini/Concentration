//
//  ViewController.swift
//  Concentration
//
//  Created by sacdigital on 23/09/19.
//  Copyright © 2019 sacdigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojis = ["🦇","👻","💀","☠️","😈"]
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.firstIndex(of: sender)
        print(cardNumber!)
        flipCard(withEmoji: "👻", on: sender)
    }

    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }

}

