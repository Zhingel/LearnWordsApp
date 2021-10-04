//
//  AllCardsView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct AllCardsView: View {
    @State var isNewCard = false
    @State var isChangeCard = false
    @State var text = ""
    @StateObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "word", ascending: true)], animation: .spring()) var words: FetchedResults<Task>
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 15){
                        ForEach(words) { card in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.gray)
                                    .shadow(color: .gray, radius: 1, x: 1, y: -1)
                                VStack {
                                    Text(card.word ?? "")
                                        .padding(3)
                                    Text(card.translatedWord ?? "")
                                        .padding(3)
                                }
                            }
                            .onLongPressGesture {
                             //   isChangeCard.toggle()
                                viewModel.delete(context: context, item: card)
                            }
                            .onTapGesture {
                                viewModel.shuffleArray(context: context)
                            }
                        }
                    }
                }
                .padding()
                .blur(radius: isNewCard  || isChangeCard ? 6 : 0)
                .opacity(isNewCard || isChangeCard ? 0.6 : 1)
                if isNewCard {
                 NewCard(isNewCard: $isNewCard)
                }
                if isChangeCard {
                 ChangeCard(isChangeCard: $isChangeCard)
                }
            }
                .toolbar {
                    Button(action: {
                        isNewCard.toggle()
                    },
                           label: {
                        Image(systemName: "plus")
                    })
                        }
                .navigationTitle("Коллекция карточек")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsView()
    }
}


struct NewCard : View {
    @Binding var isNewCard: Bool
    @StateObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var context
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .shadow(color: .black, radius: 4, x: 3, y: -5)
            VStack(spacing: 20) {
                Text("Новое слово")
                    .bold()
                    .font(.title)
                    .padding(.vertical, 30)
                ZStack {
                    TextField("на русском", text: $viewModel.word)
                        .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .opacity(0.5)
                }
                .frame(width: 200, height: 40, alignment: .center)
                ZStack {
                    TextField("на английском", text: $viewModel.translatedWord)
                        .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .opacity(0.5)
                }
                .frame(width: 200, height: 40, alignment: .center)
                Button("Save") {
                    viewModel.writeData(context: context)
                    isNewCard.toggle()
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ChangeCard : View {
    @Binding var isChangeCard: Bool
    var card : Task!
    @StateObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var context
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .shadow(color: .black, radius: 4, x: 3, y: -5)
            VStack(spacing: 20) {
                ZStack {
                    Text(card.word ?? "")
                        .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .opacity(0.5)
                }
                .frame(width: 200, height: 40, alignment: .center)
                ZStack {
                    Text(card.translatedWord ?? "")
                        .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .opacity(0.5)
                }
                .frame(width: 200, height: 40, alignment: .center)
                Button("Delete") {
                    viewModel.delete(context: context, item: card)
                    isChangeCard.toggle()
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 300)
    }
}
