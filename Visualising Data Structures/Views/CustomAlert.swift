//
//  CustomAlert.swift
//  Visualising Data Structures
//
//  Created by Wildman, Leo (RCH) on 14/03/2023.
//

import SwiftUI

struct CustomAlert: View {
    @State private var text: String = ""

    var body: some View {

        VStack {
            Text("Enter Input").font(.headline).padding()

            TextField($text, placeholder: "Hello")
                .textFieldStyle(.roundedBorder).padding()
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {

                    Text("Done")
                }
                Spacer()

                Divider()

                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {
                    Text("Cancel")
                }
                Spacer()
            }.padding(0)


            }.background(Color(white: 0.9))
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}
