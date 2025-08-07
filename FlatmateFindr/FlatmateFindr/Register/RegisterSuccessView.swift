//
//  RegisterSuccessView.swift
//  ACCompany
//
//  Created by Thangarajan K on 13/06/24.
//

import SwiftUI

struct RegisterSuccessView: View {
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        ZStack {
            Color.black
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Image("registerSuccess")
                Text("Yayy 🎉")
                    .font(.montserratBold(size: 20))
                    .foregroundStyle(Color.Color249())
                Text("Your login was successful!")
                    .font(.montserratBold(size: 20))
                    .foregroundStyle(Color.Color249())
                Text("We’re glad to welcome you to\n our community")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.Color218())
                    .font(.montserratRegular(size: 14))
                Spacer()
                SubmitButtonView(title: "Let's go") {
                    router.navigate(to: .intro)
                }
                .frame(height: 44)
                .padding([.leading, .trailing, .bottom], 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterSuccessView()
}
