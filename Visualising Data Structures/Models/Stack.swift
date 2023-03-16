//
//  Stack.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import Foundation

class Stack<T> : ObservableObject{
    @Published public var elements = [T]()
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func count() -> Int {
        return elements.count
    }
    
    func clear() {
        elements.removeAll()
    }
    
    func getAll() -> Array<T>{
        return elements
    }
}
