//
//  CreatedProfileView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI


extension Constants {
    static let amazingtitle = "Amazing 🎉\nWe have created your profile!"
    static let amazingtitle2 = ""
    static let profilevisible = "Your profile would be visible to:"
    static let otherflatmates = "People looking for other flatmates"
    static let flatvacancy = "People who have a flat and vacancy"
    static let gotohomepage = "Go to homepage"
    static let addmoredetails  = "Add more details"
    
}
struct CreatedProfileView: View {
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        VStack(spacing: 0) {
                Image("Celebration")
                    .resizable()
                    .frame(width: 260,height: 300)
                VStack(spacing: 12) {
                    Text(Constants.amazingtitle)
                        .font(.montserratBold(size: 20))
                        .multilineTextAlignment(.center)
                    Text(Constants.profilevisible)
                        .font(.montserratRegular(size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Color125())
                }
                .padding(.top, 16)
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Image("tick")
                        Text(Constants.otherflatmates)
                            .font(.montserratRegular(size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Color125())
                    }
                    HStack{
                        Image("tick")
                        Text(Constants.flatvacancy)
                            .font(.montserratRegular(size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Color125())
                    }
                    
                }
                .padding(.top, 20)
           
           
            VStack(spacing: 16){
                SubmitButtonView(title: Constants.gotohomepage) {
                    router.navigate(to: .home)
                }
                .frame(height: 44)
                Text(Constants.addmoredetails)
                    .font(.montserratSemiBold(size: 16))
                    .foregroundColor(Color.purbleColor())
                    .underline()
            }
            .padding(.top, 60)
        }
        
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CreatedProfileView()
}
