import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Não é uma carta. Escolha uma carta.")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    var emojiOptions = ["🦇","👻","💀","☠️","😈","🎃", "🤡"]

    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiOptions.count > 0 {
            let randomindex = Int(arc4random_uniform(UInt32(emojiOptions.count)))
            emoji[card.identifier] = emojiOptions.remove(at: randomindex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

