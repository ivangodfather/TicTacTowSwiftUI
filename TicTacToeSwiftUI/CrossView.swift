//
//  CrossView.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 10/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI


struct Cross: View {
    let cornerRadius: CGFloat = 16
    let crossWidth: CGFloat = 12
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .frame(width: self.crossWidth, height: min(reader.size.width, reader.size.height))
                    .rotationEffect(.degrees(45), anchor: .center)
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .frame(width: self.crossWidth, height: min(reader.size.width, reader.size.height))
                    .rotationEffect(.degrees(-45), anchor: .center)
                
            }.frame(width: min(reader.size.width, reader.size.height), height: min(reader.size.width, reader.size.height))
        }
    }
}

struct Cross_Previews: PreviewProvider {
    static var previews: some View {
        Cross()
    }
}
