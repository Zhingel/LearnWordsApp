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
                        ForEach(0..<words.count) { index in
                            if !words[index].matchUp {
                                Card(frame: g.frame(in: .global), data: words[index])
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


