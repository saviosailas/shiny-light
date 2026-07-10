// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public struct ShinyUIView: View {
    public init() { }
    public var body: some View {
        VStack {
            Text("This is shinny UI")
        }
        .padding()
    }
}

#Preview {
    ShinyUIView()
}
