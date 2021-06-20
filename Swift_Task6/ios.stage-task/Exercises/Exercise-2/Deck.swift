import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards = [Card]()
        
        for suit in suits {
            for val in values {
                let card = Card(suit: suit, value: val)
                cards.append(card)
            }
        }
       return cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }


    public mutating func defineTrump() {
        trump = cards.first?.suit
        setTrumpCards(for: trump!)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players {
            for _ in 1...6 {
                let card = cards.removeFirst()
                if (player.hand == nil) {
                    player.hand = [card]
                }
                else {
                    player.hand?.append(card)
                }
            }
        }

    }

    public mutating func setTrumpCards(for suit:Suit) {
        for (index, card) in cards.enumerated() {
            if card.suit == suit {
                cards[index].isTrump = true
            }
        }

    }
}

