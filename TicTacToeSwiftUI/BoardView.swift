//
//  Board.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 10/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    let boardThickness = CGFloat(16)
    let boardDivision = CGFloat(6)
    var body: some View {
        return GeometryReader { reader in
            
            ZStack {
                BoardLine(width: self.boardThickness,
                          height: min(reader.size.width,
                                      reader.size.height),
                          x: reader.size.width / self.boardDivision,
                          y: 0)
                BoardLine(width: self.boardThickness,
                          height: min(reader.size.width,
                                      reader.size.height),
                          x: -reader.size.width / self.boardDivision,
                          y: 0)
                BoardLine(width:  min(reader.size.width, reader.size.height),
                          height: self.boardThickness,
                          x: 0,
                          y: reader.size.width / self.boardDivision)
                BoardLine(width: min(reader.size.width, reader.size.height),
                          height: self.boardThickness,
                          x: 0,
                          y: -reader.size.width / self.boardDivision)
            }
            
        }
    }
    
    struct BoardLine: View {
        let cornerRadius = CGFloat(8)
        var width, height, x, y: CGFloat
        
        var body: some View {
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: width, height: height)
            .offset(x: x, y: y)
        }
    }
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardView()
                .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
