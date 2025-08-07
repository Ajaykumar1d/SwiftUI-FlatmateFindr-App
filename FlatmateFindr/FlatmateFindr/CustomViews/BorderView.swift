//
//  BorderView.swift
//  ACCompany
//
//  Created by Thangarajan K on 12/06/24.
//

import SwiftUI

struct BorderView: View {
     var title: String?
    @Binding var textValue: String?
    @State var textfield: String = ""
    @State var placeholder: String = ""
    @State var textFieldType: TextFieldType = .phoneNumber
    @State var borderColor: Color = .borderColor225()
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading, content: {
                ZStack {
                    Color.white
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 1)
                )
                Text(" " + (title ?? ""))
                    .foregroundStyle(Color.Color125())
                    .background(Color.white)
                    .padding(.leading, 18)
                    .padding(.top, -7)
                    .font(Font.interRegular(size: 12))
                
            })
            HStack(spacing: 8) {
                if textFieldType == .phoneNumber {
                    Image("countryCode")
                        .padding(.leading, 24)
                }
                TextField("", text: $textfield, prompt: Text(placeholder)
                    .font(Font.interMedium(size: 16))
                )
                .keyboardType(textFieldType == .name ? .default : .numberPad)
                .font(Font.interMedium(size: 16))
                .padding(.leading, textFieldType == TextFieldType.phoneNumber ? 0 : 24)
            }
        }
        .onAppear {
            if textFieldType == .phoneNumber {
                textfield = "9786542311"
            }
        }
        .onChange(of: textfield) { oldValue, newValue in
            DispatchQueue.main.async {
                switch textFieldType {
                case .phoneNumber:
                    if newValue.count > 10 {
                        textfield = oldValue
                    }
                case .sms:
                    if newValue.count > 6 {
                        textfield = oldValue
                    }
                case .name:
                    textfield = newValue
                }
                textValue = newValue
            }
        }
    }
}

