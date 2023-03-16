//
//  StackView.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import SwiftUI


struct StackView: View {
    @StateObject private var stack = Stack()
    @State private var toBePushed:String = ""
    @State private var radius:Int = 5
    @State private var blur:Bool = true
    @State private var presentPeek:Bool = false
    @State private var presentPop:Bool = false

    func push(){
        stack.push(stackElement(value: toBePushed, blurred: blur))
    }
    
    var body: some View {
        VStack {
            Text("Stack Example")
                .font(.title)
                .padding()
            ScrollView{
                ForEach(stack.elements.reversed()) { item in
                    VStack{
                        Button {
                        } label: {
                            Text("\(item.value)")
                                .frame(maxWidth:.infinity)
                        }
                        .padding(.horizontal)
                        .buttonStyle(.bordered)
                        .blur(radius:(item.blurred ? 5:0))
                    }
                }
            }
            Spacer()
            TextField(
                "Item Data:",
                text: $toBePushed
            ).onSubmit {
                push()
            }.textFieldStyle(.roundedBorder)
            HStack{
                VStack{
                Toggle(isOn: $blur){
                }.toggleStyle(.switch)
                    .labelsHidden()
                    Text("Blur")
                        .font(.body)
                }.scaleEffect(CGSize(width:0.7, height:0.7), anchor: .center)
                Button(){
                    presentPeek = true
                } label:{
                    Text("Peek")
                }.alert("Peek: \(stack.peek().value)", isPresented: $presentPeek) {
                    Button("OK", role: .cancel) { }
                }
                Button(){
                    push()
                } label:{
                    Text("Push")
                }

                Button(){
                    presentPop = true
                } label:{
                    Text("Pop")
                }
                .padding(.trailing)
                .alert("Pop: \(stack.pop().value)", isPresented: $presentPeek) {
                    Button("OK", role: .cancel) { }
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
