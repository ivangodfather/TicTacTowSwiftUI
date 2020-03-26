//
//  NoughtView.swift
//  TicTacToeSwiftUI
//
//  Created by Ivan Ruiz Monjo on 10/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct Nought: View {
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Rectangle()
                    .clipShape(Circle())
                    .frame(width: min(reader.size.width, reader.size.height) / 1.2, height: min(reader.size.width, reader.size.height) / 1.2)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: min(reader.size.width, reader.size.height) / 1.5, height: min(reader.size.width, reader.size.height) / 1.5)
                    .clipShape(Circle())
            }
        }
    }
}

struct Nought_Previews: PreviewProvider {
    static var previews: some View {
        Nought()
    }
}
