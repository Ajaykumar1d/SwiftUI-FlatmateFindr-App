//
//  DoubleButtonView.swift
//  ACCompany
//
//  Created by product minmini on 20/06/24.
//

import SwiftUI

struct DoubleButtonView: View {
    @State var firsttitle: String = ""
    @State var secondtitle: String = ""
    var firstButtonAction: ()->Void
    var secondButtonAction: ()->Void
    var body: some View {
        ZStack {
            HStack(spacing:12) {
                ZStack {
                    Color.white
                    Text(firsttitle)
                        .foregroundStyle(Color.primaryPurple())
                        .font(.montserratSemiBold(size: 16))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primaryPurple(), lineWidth: 2))
                .onTapGesture(perform: {
                    firstButtonAction()
                })
                .clipShape(RoundedRectangle(cornerRadius: 8))
                ZStack {
                    Color.purbleColor()
                    Text(secondtitle)
                        .foregroundStyle(Color.white)
                        .font(.montserratSemiBold(size: 16))
                }
                .onTapGesture(perform: {
                    secondButtonAction()
                })
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(height: 44)
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            
        }
        .frame(height: 44)
    }
}

#Preview {
    DoubleButtonView(firstButtonAction: {}, secondButtonAction: {})
}
