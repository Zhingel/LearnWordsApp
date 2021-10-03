//
//  ViewModel.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    @Published var updateItem: Task!
    @Published var word = ""
    @Published var translatedWord = ""
    @Published var offset: Float = 0
    @Published var matchUp = false
    
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
    
    
    
    func writeData(context: NSManagedObjectContext) {
        
        //updating
        if updateItem != nil {
            updateItem.matchUp = matchUp
            updateItem.word = word
            updateItem.translatedWord = translatedWord
            updateItem.offset = offset
            try! context.save()
            updateItem = nil
    //        isNewData.toggle()
        }
        
        else {
            let newTask = Task(context: context)
            newTask.matchUp = matchUp
            newTask.word = word
            newTask.translatedWord = translatedWord
            newTask.offset = offset
            
            do {
                try context.save()
//                title = ""
//                toDo = "Edit text"
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
//    func writeCheck(context: NSManagedObjectContext) {
//        
//        //updating
//        if updateItem != nil {
//            updateItem.check = check
//            try! context.save()
//            updateItem = nil
//            
//        }
//        
//    }
//   func EditCheck(item: Task) {
//        updateItem = item
//        check = item.check
//
//
//    }
//    func isPressed(item: Task) {
//        updateItem = item
//        isPressed = item.isPressed
//
//    }
//
//
//    
    func delete(context: NSManagedObjectContext, item: Task)  {
        context.delete(item)
        try! context.save()
        
    }




}
