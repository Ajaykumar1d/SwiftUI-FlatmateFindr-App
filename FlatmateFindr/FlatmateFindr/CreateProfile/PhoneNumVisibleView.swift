//
//  PhoneNumVisibleView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

extension Constants {
    static let phoneTitle = "Make phone number\nvisible to all?"
    static let phoneSubTitle = "People can contact you on +91********96"
    static let phoneCardTitle = "Yes, I want my number to be\nvisible to others"
    static let phoneCardSubTitle = "People can contact you directly or send\nyou a message"
    static let phoneCardTitle2 = "No, I don’t want my number to\nbe visible to others"
    static let phoneCardSubTitle2 = "People can request for your number or\nsend you a message"
}

struct PhoneNumVisibleView: View {
    @EnvironmentObject var router: NavigationRouter
    private var list = [["title": Constants.phoneCardTitle, "subtitle": Constants.phoneCardSubTitle], ["title": Constants.phoneCardTitle2, "subtitle": Constants.phoneCardSubTitle2]]
    @State var cardTitle: String = ""
    @State var cardsubTitle: String = ""
    @State var bottomBtn:Bool = false
    var body: some View {
        VStack(spacing: 32){
            NavigationProgressView(title: Constants.phoneTitle, subtitle:Constants.phoneSubTitle){
                router.navigateBack()
            }
            VStack(spacing: 20) {
                ForEach(list, id: \.self) { item in
                    HStack {
                        VStack(alignment: .leading, spacing:4) {
                            Text(item["title"] ?? "")
                                .font(.montserratBold(size: 14))
                            Text(item["subtitle"] ?? "")
                                .font(.montserratRegular(size: 12))
                        }
                        .padding([.leading, .top, .bottom], 12)
                        Spacer()
                        Image(cardTitle == item["title"] ? "blue_check":"circle")
                            .resizable()
                            .frame(width: 24,height: 24)
                            .padding(.trailing, 12)
                    }
                    .frame(height: 108)
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(cardTitle == item["title"] ? .purple4() : Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(cardTitle == item["title"] ? .purbleColor():Color.borderColor225(), lineWidth: 1))
                    .onTapGesture(perform: {
                        cardTitle = item["title"] ?? ""
                        cardsubTitle = item["subtitle"] ?? ""
                        bottomBtn = true
                    })
                }
            }
            
            Spacer()
            if bottomBtn {
                SubmitButtonView(title: Constants.next) {
                    router.navigate(to: .work)
                }
                .frame(height: 44)
                .padding(.bottom, 20)
            }
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PhoneNumVisibleView()
}



