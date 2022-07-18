//
//  ProfileScreen.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 05.06.2022.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State var showModal: Bool = false
    @State var myText: String = "This is some text in UITextView"
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                showModal.toggle()
            } label: {
                Text("Show Modal")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color.indigo)
                    .background(Color.mint)
                    .cornerRadius(8)
                
            }.sheet(isPresented: $showModal) {
                Text("🥬")
                    .font(.system(size: 300))
            }
            MyUITextView(text: $myText)
        } //VStack
    }
}

struct MyUITextView: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.font = .preferredFont(forTextStyle: .body)
        view.font = .systemFont(ofSize: 40, weight: .regular)
        view.textColor = .green
        view.textAlignment = .center
        view.backgroundColor = .black
        return view
    }
    
    func updateUIView(_ view: UITextView, context: Context) {
        view.text = text
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
