//
//  ViewModel.swift
//  LearnWordsApp
//
//  Created by Стас Жингель on 03.10.2021.
//

import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var context
    @Published var updateItem: Task!
    @Published var word = ""
    @Published var translatedWord = ""
    @Published var offset: Float = 0
    @Published var matchUp = false
    @Published var random: Double = 0
//    @Published var arrayOfCards: [Task?] = []
//
//    func shuffleArray(context: NSManagedObjectContext) {
//        for (i,card) in arrayOfCards.enumerated() {
//
//        }
//    }
    func loadArray() -> [Task]? {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()

        do {
            let array = try self.context.fetch(fetchRequest) as [Task]
            print(array)
            return array
        } catch let errore {
            print("error FetchRequest \(errore)")
        }

        return nil
    }
    func load() -> [Task] {
        let array = loadArray()
        return array!
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
        }
        
        else {
            let newTask = Task(context: context)
            newTask.matchUp = matchUp
            newTask.word = word
            newTask.translatedWord = translatedWord
            newTask.offset = offset
            
            do {
                try context.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    func randomize(context: NSManagedObjectContext) {
        
        //updating
        if updateItem != nil {
            updateItem.random = random
            try! context.save()
            updateItem = nil
        }
    }
    func delete(context: NSManagedObjectContext, item: Task)  {
        context.delete(item)
        try! context.save()
        
    }
}
