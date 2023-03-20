//
//  LinkedList.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import Foundation

public class Node<T>: Identifiable {
    public var id = UUID()
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: Int = 0
    
    public init() {
        
    }
    
    func add(value: T) {
        let newNode = Node<T>(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail!.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    func remove(at index: Int) {
        guard index >= 0 && index < count else { return }
        if index == 0 { // if the head is being removed
            head = head!.next
            count -= 1
            return
        }
        var currentNode = head
        for _ in 0..<index-1 {
            currentNode = currentNode!.next
        }
        currentNode!.next = currentNode!.next!.next
        count -= 1
    }
    
    func insert(value: T, at index: Int) {
        if index < 0 || index > count {
            return
        }
        let newNode = Node<T>(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
            count += 1
            return
        }
        var currentNode = head
        for _ in 0..<index-1 {
            currentNode = currentNode!.next
        }
        newNode.next = currentNode!.next
        currentNode!.next = newNode
        count += 1
    }
    
    func get(at index: Int) -> T? {
        if index < 0 || index >= count {
            return nil
        }
        var currentNode = head
        for _ in 0..<index {
            currentNode = currentNode!.next
        }
        return currentNode!.value
    }
    
    func getAll() -> [T] {
        var returnArray: [T] = []
        var currentNode = head
        for _ in 0..<count {
            returnArray.append(currentNode!.value)
            currentNode = currentNode!.next
        }
        return returnArray
    }
    
    func getCount() -> Int {
        return count
    }
}
