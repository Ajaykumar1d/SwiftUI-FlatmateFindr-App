//
//  AboutYouView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

extension Constants {
    static let aboutyou = "About you"
    static let aboutyousubtitile = "Write a fun bio about yourself so,\nkeep it light hearted :)"
    static let aboutyoutextplaceholder = "Moving cities for the first time and.."
    static let maxChar = "Max limit: 200 characters"
}

import SwiftUI

struct AboutYouView: View {
    @EnvironmentObject var router: NavigationRouter
    private var sugglist = ["I am moving cities for the first time", "I love having house parties on weekends", "I prefer keeping my expenses separate"]
    @State private var abouttext: String = ""
    @State private var selectedIteam: String?
    var body: some View {
        VStack(spacing: 30){
            NavigationProgressView(title: Constants.aboutyou, subtitle:Constants.aboutyousubtitile){
                router.navigateBack()
            }
            
            VStack(spacing: 8) {
                TextField(Constants.aboutyoutextplaceholder, text: $abouttext, axis: .vertical)
                    .frame(minHeight: 56)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .font(.interMedium(size: 16))
                    .onChange(of: abouttext) { oldValue, newValue in
                        if newValue.count > 200 {
                            abouttext = String(newValue.prefix(200))
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.borderColor225(), lineWidth: 1))
                HStack{
                    Spacer()
                    Text(Constants.maxChar)
                        .font(.interRegular(size: 12))
                        .foregroundColor(.gray11())
                }.frame(height: 15)
            }
            VStack(spacing: 8) {
                ForEach(sugglist, id: \.self) { item in
                    HStack {
                        Spacer(minLength: 0)
                        Text(item)
                            .font(.montserratSemiBold(size: 14))
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        Spacer(minLength: 0)
                    }
                    .foregroundColor(selectedIteam == item ? .purbleColor():Color.black)
                    .background(
                        RoundedRectangle(cornerRadius: 16).fill(selectedIteam == item ? .purple2() : Color.clear)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(selectedIteam == item ? .purbleColor():Color.borderColor225(), lineWidth: 1))
                    .onTapGesture(perform: {
                        selectedIteam = item
                    })
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.borderColor225(), lineWidth: 1))
            }
            Spacer()
            SubmitButtonView(title: Constants.next) {
                router.navigate(to: .phoneview)
            }
            .frame(height: 44)
            .padding(.bottom, 20)
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AboutYouView()
}
