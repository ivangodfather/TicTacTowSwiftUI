//
//  ContentView.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 10/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI
import Darwin

struct ContentView: View {
    
    @ObservedObject var game: Game
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                ZStack {
                    BoardView()
                    self.boardTiles()
                }.frame(width: min(reader.size.width, reader.size.height),
                        height: min(reader.size.width, reader.size.height)
                ).alert(isPresented: self.$game.hasEnded) {
                        Alert(title: Text("The winner is... " + self.game.winner.rawValue), dismissButton: Alert.Button.default(Text("New Game"), action: {
                                self.game.newGame()
                            })
                        )
                }.navigationBarTitle("Tic Tac Toe")
            }
        }
    }
    
    private func boardTiles() -> some View {
        VStack {
            ForEach(Array(0...2), id: \.self) { y in
                HStack {
                    ForEach(Array(0...2), id: \.self) { x in
                        TileView(content: self.game.board[x][y], action: {
                            self.game.didTap(x: x, y: y)
                        })
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: Game())
    }
}
