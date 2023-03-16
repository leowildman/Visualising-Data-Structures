//
//  StackView.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import SwiftUI


struct StackView: View {
    @StateObject private var stack = Stack<String>()
    
    func push(){
        let alert = UIAlertController(title: "Add new element", message: nil, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Add", style: .default) {(_) in
            if let textField = alert.textFields?.first, let text = textField.text {
                stack.push(text)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(_)in}
        alert.addTextField { (textField) in
            textField.placeholder = "Element name"
        }
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    var body: some View {
        VStack {
            Text("Stack Example")
                .font(.title)
                .padding()
            ScrollView{
                ForEach(stack.elements.reversed(), id: \.self) { item in
                    VStack{
                        Button {
                        } label: {
                            Text("\(item)")
                                .frame(maxWidth:.infinity)
                        }
                        .padding(.horizontal)
                        .buttonStyle(.bordered)
                    }
                }
            }
            HStack{
                Button(){
                    push()
                } label:{
                    Text("Push")
                }.alert("New Element", isPresented: $isAdding)
                
                Button(){
                    stack.pop()
                } label:{
                    Text("Pop")
                }
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
