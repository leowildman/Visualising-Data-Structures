//
//  Stack.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import Foundation

struct stackElement : Identifiable{
    var id = UUID()
    
    let value:String
    var blurred:Bool
}

class Stack : ObservableObject{
    @Published public var elements = [stackElement]()
    
    init(){
        elements.append(stackElement(value:"Bottom", blurred: true))
        elements.append(stackElement(value:"Middle", blurred:true))
        elements.append(stackElement(value:"Top", blurred:true))
    }
    
    func push(_ element: stackElement) {
        elements.append(element)
    }
    
    func pop() -> stackElement{
        return (elements.popLast() ?? stackElement(value: "", blurred: true))
    }
    
    func peek() -> stackElement{
        return (elements.last ?? stackElement(value: "", blurred: true))
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
    
    func getAll() -> Array<stackElement>{
        return elements
    }
}
