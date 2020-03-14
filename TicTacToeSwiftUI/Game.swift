//
//  File.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 12/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

enum TileContent: String, Identifiable {
    var id: String {
        return rawValue
    }
    
    case undefined
    case nought
    case cross
}

class Game: ObservableObject {
    
    @Published var board: [[TileContent]] = Array(repeating: Array(repeating: TileContent.undefined, count: 3), count: 3)
    @Published var hasEnded = false
    @Published var winner = TileContent.undefined
    
    private var turn = TileContent.nought
    
    func didTap(x: Int, y: Int) {
        guard board[x][y] == TileContent.undefined else {
            return
        }
        board[x][y] = turn
        checkWinner()
        turn = turn == .nought ? .cross : .nought
        if !availableTiles() && !hasEnded {
            hasEnded = true
        }
    }
    
    func newGame() {
        turn = .nought
        board = Array(repeating: Array(repeating: TileContent.undefined, count: 3), count: 3)
        winner = .undefined
        hasEnded = false
    }
    
    private func availableTiles() -> Bool {
        var availableTiles = false
        board.forEach { row in
            row.forEach { tile in
                if tile == .undefined {
                    availableTiles = true
                }
            }
        }
        return availableTiles
    }
    
    private func checkWinner() {
        let winningCombinations: [((x: Int, y: Int), (x: Int, y: Int), (x: Int, y: Int))] = [
            ((0,0), (1,0), (2,0)),
            ((0,1), (1, 1), (2, 1)),
            ((0,2), (1,2), (2, 2)),
            ((0,0), (0, 1), (0, 2)),
            ((1,0), (1, 1), (1, 2)),
            ((2,0), (2, 1), (2, 2)),
            ((0,0), (1, 1), (2, 2)),
            ((2,0), (1, 1), (0, 2)),
        ]
        winningCombinations.forEach { combination in
            if board[combination.0.x][combination.0.y] == board[combination.1.x][combination.1.y] {
                            if board[combination.0.x][combination.0.y] == board[combination.2.x][combination.2.y] {
                                if board[combination.0.x][combination.0.y] != .undefined {
                                    hasEnded = true
                                    winner = board[combination.0.x][combination.0.y]
                                }
                }
                
            }
        }
    }
}
