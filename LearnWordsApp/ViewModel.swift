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
