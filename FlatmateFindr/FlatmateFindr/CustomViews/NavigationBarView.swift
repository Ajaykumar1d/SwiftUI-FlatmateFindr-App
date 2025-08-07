//
//  NavigationBarView.swift
//  ACCompany
//
//  Created by Thangarajan K on 12/06/24.
//

import SwiftUI

struct NavigationBarView: View {
    @State var title: String?
    @State var backButton: Bool = true
    var backButtonAction: ()-> Void?
    
    var body: some View {
        VStack(alignment: .leading, content: {
            if backButton {
                HStack(spacing: 5, content: {
                    Button(action: {backButtonAction()}, label: {
                        Image("backArrow")
                            .frame(width: 45, height: 45)
                    })
                    .padding(.leading, 20)
                    Text(title ?? "")
                        .foregroundStyle(Color.Color75())
                        .font(.montserratSemiBold(size: 16))
                    
                })
            } else {
                Text(title ?? "")
                    .foregroundStyle(Color.Color75())
                    .font(.montserratSemiBold(size: 16))
                    .padding(.leading, 20)
            }
            Divider()
        })
    }
}

#Preview {
    NavigationBarView(backButtonAction: {})
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
