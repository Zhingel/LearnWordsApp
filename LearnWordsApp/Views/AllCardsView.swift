//
//  AllCardsView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct AllCardsView: View {
    @StateObject var viewModel = ViewModel()
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns){
                        ForEach(viewModel.cards) { card in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.gray)
                                    .shadow(color: .gray, radius: 1, x: 1, y: -1)
                                VStack {
                                    Text(card.word)
                                        .padding(3)
                                    Text(card.translatedWord)
                                        .padding(3)
                                }
                            }
                        }
                    }
                }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.gray)
                    .shadow(color: .black, radius: 4, x: 3, y: -5)
            }
                    .toolbar {
                        Button(action: {
                            
                        },
                               label: {
                            Image(systemName: "plus")
                        })
                            }
                    .navigationTitle("Коллкция карточек")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsView()
    }
}
