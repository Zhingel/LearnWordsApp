//
//  PlayWordsView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct PlayWordsView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "word", ascending: true)], animation: .spring()) var words: FetchedResults<Task>
    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ForEach(words) { word in
                            if !word.matchUp {
                                Card(frame: g.frame(in: .global), data: word)
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(Color.black)
        }
    }
}

struct PlayWordsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWordsView()
    }
}


