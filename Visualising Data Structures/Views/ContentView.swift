//
//  ContentView.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            StackView()
                .tabItem {
                Label("Stack", systemImage: "square.stack.fill")
            }
            QueueView()
                .tabItem {
                Label("Queue", systemImage: "person.3.sequence.fill")
            }
            LinkedListView()
                .tabItem {
                Label("Linked List", systemImage: "arrowshape.turn.up.left")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
