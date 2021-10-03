//
//  ViewModel.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    var cards = [Word(word: "First", translatedWord: "Первый", offset: 0),
                 Word(word: "Second", translatedWord: "Второй", offset: 0),
                 Word(word: "Third", translatedWord: "Третий", offset: 0),
                 Word(word: "Fourth", translatedWord: "Четвертый", offset: 0),
                 Word(word: "Fifth", translatedWord: "Пятый", offset: 0),
                 Word(word: "Sixth", translatedWord: "Шестой", offset: 0),
                 Word(word: "Seventh", translatedWord: "Седьмой", offset: 0),
                 Word(word: "Eighth", translatedWord: "Восьмой", offset: 0),
                 Word(word: "Ninth", translatedWord: "Девятый", offset: 0)
    ]
    
    func cardRandomName() -> Int {
        let randomValue = Int.random(in: 0..<cards.count)
        return randomValue
    }
}
