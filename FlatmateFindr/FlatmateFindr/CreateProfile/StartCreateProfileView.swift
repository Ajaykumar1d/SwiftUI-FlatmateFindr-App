//
//  StartCreateProfileView.swift
//  ACCompany
//
//  Created by Thangarajan K on 20/06/24.
//

import SwiftUI

struct StartCreateProfileView: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 12) {
                Spacer()
                Image("profile_interface")
                Text("Let’s quickly create a \nprofile for you to be found")
                    .font(.montserratBold(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                Text("This profile will be visible to others who are \nalso looking for a flatmate")
                    .font(.montserratRegular(size: 14))
                    .multilineTextAlignment(.center)
                Spacer()
                SubmitButtonView(title: "+ Create Profile", submitButtonAction: {
                    
                })
                .frame(height: 44)
                .padding([.leading, .trailing, .bottom], 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    StartCreateProfileView()
}
