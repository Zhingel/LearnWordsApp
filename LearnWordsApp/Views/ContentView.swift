//
//  ContentView.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PlayWordsView()
                .tabItem {
                    Text("First")
                }
            AllCardsView()
                .tabItem {
                    Text("Second")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
