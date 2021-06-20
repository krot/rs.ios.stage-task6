//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        self.hand!.contains { $0.value == card.value}
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        var onTable: [Card] = Array<Card>(table.keys)
        onTable.append(contentsOf: Array<Card>(table.values))
        var res = false;
        
        for card in onTable {
             res = self.hand!.contains { $0.value == card.value }
            break
        }
        return res
    }
}
