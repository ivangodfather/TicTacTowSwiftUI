//
//  TileView.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 12/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct TileView: View {
    
    var content: TileContent
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            if content == .cross {
                Cross()
            } else if content == .nought {
                Nought()
            }
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(content: TileContent.cross, action: {})
    }
}
