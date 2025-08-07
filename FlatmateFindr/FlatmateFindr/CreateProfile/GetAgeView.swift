//
//  GetAgeView.swift
//  ACCompany
//
//  Created by Thangarajan K on 21/06/24.
//

import SwiftUI

extension Constants {
    static let agetitle = "How old are you?"
}

struct GetAgeView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var ageValue: String = ""
    var body: some View {
        ZStack {
            VStack {
                NavigationProgressView(title: Constants.agetitle){
                    router.navigateBack()
                }
                TextField("", text: $ageValue, prompt: Text("23")
                    .font(Font.interSemiBold(size: 28))
                )
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .font(Font.interMedium(size: 16))
                .padding([.leading, .trailing], 20)
                .padding(.top, 80)
                .padding(.bottom, 20)
                Divider()
                    .padding([.leading, .trailing], 20)
                    
                
                HStack {
                    Image("Eye")
                        .resizable()
                        .frame(width: 20,height: 16)
                    Text(Constants.invisible)
                        .font(.interRegular(size: 16))
                        .foregroundColor(Color.borderColor225())
                    Spacer()
                }
                .padding(.top, 12)
                .padding(.leading, 20)
                Spacer()
                
                SubmitButtonView(title: Constants.next) {
                    router.navigate(to: .aboutyou)
                }
                .frame(height: 44)
                .padding(.bottom, 20)
            }
            .padding([.leading, .trailing], 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GetAgeView()
}
