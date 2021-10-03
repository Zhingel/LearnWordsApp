//
//  CardView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct Card: View {
    @State var card: Word
    var frame: CGRect
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .foregroundColor(.gray)
                .shadow(color: .black, radius: 4, x: 5, y: -5)
            if card.isFaceUp {
                Text(card.word)
            } else {
                Text(card.translatedWord)
            }
        }
        .frame(width: 300, height: 250, alignment: .center)
        .font(.title)
        .onTapGesture {
            card.isFaceUp.toggle()
        }
        .offset(x: card.offset)
        .rotationEffect(.init(degrees: card.offset == 0 ? 0 : (card.offset > 0 ? 10: -10)))
        .gesture(DragGesture()
                .onChanged({ value in
            withAnimation(.default) {
                        card.offset = value.translation.width
                    }})
                .onEnded({ value in
            withAnimation(Animation.easeIn) {
                if card.offset > 150 {
                    card.offset = 500
                    card.matchUp.toggle()
                } else if card.offset < -150 {
                    card.offset = -500
                    card.matchUp.toggle()
                } else  {
                    card.offset = 0
                }
            }}))
    }
}



