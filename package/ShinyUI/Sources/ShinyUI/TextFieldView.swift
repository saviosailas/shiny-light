//
//  SwiftUIView.swift
//  ShinyUI
//
//  Created by user on 11/07/26.
//

import SwiftUI

/// Creates a text field with a prompt generated from a `Text`.
///
/// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
/// whenever the user submits this text field.
///
/// - Parameters:
///   - text: The text to display and edit.
///   - prompt: A `Text` representing the prompt of the text field
///     which provides users with guidance on what to type into the text
///     field.
///   - label: A view that describes the purpose of the text field.

public struct TextFieldView<Label: View>: View {
    
    @Binding private var text: String
    private let prompt: Text?
    private let label: Label
    
    public init(
        text: Binding<String>,
        prompt: Text? = nil,
        @ViewBuilder label: () -> Label
    ) {
        self._text = text
        self.prompt = prompt
        self.label = label()
    }
    
    public var body: some View {
        TextField(text: $text, prompt: prompt, label: {
                label
            }
        )
    }
}


#Preview {
    
    @Previewable @State var text = ""
    
    TextFieldView(
        text: $text,
        prompt: Text("Enter username (prompt)").foregroundStyle(.red)
    ) {
        Text("label will be hidden")
            .foregroundStyle(Color.blue)
    }
    .padding()
    
    if #available(iOS 18.0, *) {
        TextFieldView(text: $text, prompt: nil) {
            HStack {
                Image(systemName: "xmark")
                Text("label will be visible")
                    .foregroundStyle(Color.blue)
            }
        }
        .labelsVisibility(.visible)
        .padding()
    }
    
    TextField(text: $text, prompt: nil, axis: .vertical) {
        Label {
            Text("This is label")
        } icon: {
            Image(systemName: "xmark")
                .resizable()
        }

    }
    .onSubmit {
        text = ""
    }
}


#if DEBUG

// Preview for older iOS version where @Previewable is not supported
struct TextFieldViewPreview: View {
    @State private var text = ""

    var body: some View {
        TextFieldView(
            text: $text,
            prompt: Text("Enter username")
        ) {
            Text("Username")
        }
    }
}

#Preview {
    TextFieldViewPreview()
}
#endif
