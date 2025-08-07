//
//  GetNameView.swift
//  ACCompany
//
//  Created by Thangarajan K on 20/06/24.
//

import SwiftUI

extension Constants {
    static let whatdowecallu = "What do we call you?"
    static let nameDesc = "Please help us with your name"
}

struct GetNameView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var nameValue: String?
    var body: some View {
        ZStack {
            VStack {
                NavigationProgressView(title: Constants.whatdowecallu, subtitle: Constants.nameDesc){
                    router.navigateBack()
                }
                
                BorderView(title: "Name", textValue: $nameValue, placeholder: "Neeraj Sharma", textFieldType: .name)
                    .frame(height: 64)
                    .padding(.top, 20)
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
                Spacer()
                
                SubmitButtonView(title: Constants.next) {
                    router.navigate(to: .getAge)
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
    GetNameView()
}
