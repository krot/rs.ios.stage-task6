//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minValue: Value? = nil
        var minPlayer: Player? = nil
        var trumpSuit : Suit? = nil
        var found = false
        
        
        for player in players {
            for (_, card) in player.hand!.enumerated() {
                if (card.isTrump) {
                    trumpSuit = card.suit
                    found = true
                    break
                }
            }
            if found {
                break
            }
        }
        
        if (trumpSuit != nil) {
            for player in players {
                for (_, card) in player.hand!.enumerated() {
                    if card.suit == trumpSuit {
                        if minValue == nil {
                            minValue = card.value
                            minPlayer = player
                        }
                        else {
                            if card.value.rawValue < minValue!.rawValue {
                                minValue = card.value
                                minPlayer = player
                            }
                         }
                    }
                }
            }
        }
        return minPlayer
    }
}
