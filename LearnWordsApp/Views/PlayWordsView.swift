//
//  PlayWordsView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct PlayWordsView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var isFaceUp = false
    var body: some View {
        GeometryReader { g in
            ZStack {
                ForEach(viewModel.cards) { card in
                    Card(card: card, frame: CGRect(x: 300, y: 300, width: 200, height: 200), isFaceUp: $isFaceUp)
                    
//                    .gesture(DragGesture()
//                                .onChanged({ value in
//                        withAnimation(.default) {
//                            card.offset = value.translation.width
//                        }
//                    })
//                                .onEnded({ <#Self.Value#> in
//                        <#code#>
//                    }))
                    .frame(width: 300, height: 250, alignment: .center)
                    .font(.title)
                    .onTapGesture {
                       isFaceUp.toggle()
                    }
                }
            }
        }
    }
}

struct PlayWordsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWordsView()
    }
}


struct Card: View {
    @State var card: Word
    var frame: CGRect
    @Binding var isFaceUp: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: frame.width, height: frame.height))
                .stroke(lineWidth: 3)
                .foregroundColor(.orange)
            if isFaceUp {
                Text(card.word)
            } else {
                Text(card.translatedWord)
            }
        }
        .gesture(DragGesture()
                                        .onChanged({ value in
                                withAnimation(.default) {
                                    card.offset = value.translation.width
                                }
                            })
                                        .onEnded({ <#Self.Value#> in
                                <#code#>
                            }))
    }
}
