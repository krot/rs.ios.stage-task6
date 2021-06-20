import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible, Equatable {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        let res = lhs.suit == rhs.suit && lhs.value == rhs.value && lhs.isTrump == rhs.isTrump
        return res
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {

        if self.isTrump && !card.isTrump {
            return true
        }
        if self.suit.rawValue == card.suit.rawValue {
            return card.value.rawValue < self.value.rawValue
        }
        return false
    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}
