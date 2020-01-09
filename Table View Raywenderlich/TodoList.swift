//
//  TodoList.swift
//  Table View Raywenderlich
//
//  Created by yash on 23/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var mediumPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        let row5Item = ChecklistItem()
        let row6Item = ChecklistItem()
        let row7Item = ChecklistItem()
        let row8Item = ChecklistItem()
        let row9Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        row5Item.text = "Go for cycling"
        row6Item.text = "Playing video games"
        row7Item.text = "Listening to bhakti"
        row8Item.text = "Submission of assigment"
        row9Item.text = "Make a trip"
        
        
        addTodo(row0Item, for: .medium)
        addTodo(row1Item, for: .low)
        addTodo(row2Item, for: .high)
        addTodo(row3Item, for: .no)
        addTodo(row4Item, for: .medium)
        addTodo(row5Item, for: .medium)
        addTodo(row6Item, for: .low)
        addTodo(row7Item, for: .high)
        addTodo(row8Item, for: .no)
        addTodo(row9Item, for: .medium)

    }
    
    func addTodo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1) {
        switch priority {
        case .high:
            if index < 0 {
                highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriorityTodos.append(item)
            } else {
                lowPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriorityTodos.append(item)
            } else {
                mediumPriorityTodos.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriorityTodos.append(item)
            } else {
                noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
            return highPriorityTodos
        case .low:
            return lowPriorityTodos
        case .medium:
            return mediumPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    func todoItem() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriorityTodos.append(item)
        return item
    }
    
//    func move(item: ChecklistItem, to index: Int) {
//        guard let currentIndex = todos.index(of: item) else {
//            return
//        }
//        todos.remove(at: currentIndex)
//        todos.insert(item, at: index)
//    }
    
    func move(item: ChecklistItem, from sourcePriority: Priority, at sourceIndex: Int, to destinationPriority: Priority, at destinationIndex: Int) {
        remove(item, for: sourcePriority, at: sourceIndex)
        addTodo(item, for: destinationPriority, at: destinationIndex)
    }
    
    func remove(_ item: ChecklistItem, for priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["Hello world", "I need to do something", "Clean my bed", "Write an exam", "Go to the mall"]
        let randomNumber = Int.random(in: 0...titles.count - 1)
        return titles[randomNumber]
        
    }
    
}
