//
//  Model.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

struct Word: Identifiable {
    var id = UUID()
    var word: String
    var translatedWord: String
    var isFaceUp: Bool = false
    var matchUp: Bool = false
    var offset: CGFloat
}
