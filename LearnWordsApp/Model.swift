//
//  Model.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import Foundation

struct Word: Identifiable {
    var id = UUID()
    var word: String
    var translatedWord: String
    var isFaceUp: Bool = false
    var MatchUp: Bool = false
    var offset = 0
}
