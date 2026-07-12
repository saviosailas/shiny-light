//
//  ContentView.swift
//  Shiny Lite
//
//  Created by user on 10/07/26.
//

import ShinyUI
import SwiftUI

struct RootView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        
        ScrollView {
            VStack {
                
                TextFieldView(text: $email, prompt: Text("Enter your email")) {}
                    .padding()
                    .background(alignment: .leading) {
                        Color.yellow.opacity(0.4)
                    }
                
                TextFieldView(text: $password, prompt: Text("Enter your email")) {}
                    .padding()
                    .background(alignment: .leading) {
                        Color.green.opacity(0.4)
                    }
            }
        }
    }
}

#Preview {
    RootView()
}
