import Foundation


class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //Todo: Shuffle cards
    }
}
