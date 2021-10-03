//
//  PlayWordsView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct PlayWordsView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ForEach(viewModel.cards) { card in
                            Card(card: card, frame: g.frame(in: .global))
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct PlayWordsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWordsView()
    }
}


