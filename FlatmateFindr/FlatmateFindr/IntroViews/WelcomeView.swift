//
//  WelcomeView.swift
//  ACCompany
//
//  Created by Ajaykumar D on 13/06/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var isAgentSelected: Bool = false
    @State var isIndividualSelected: Bool = false
    @State var showNextBtn: Bool = false
    
    var body: some View {
        ZStack {
            Color.appBlack()
            VStack {
                VStack(alignment: .center, spacing: 20) {
                    Text("Welcome to accompany, who \ndo you identfy as?")
                        .font(.montserratBold(size: 20))
                        .foregroundStyle(Color.customColor(code: 249))
                        .multilineTextAlignment(TextAlignment.center)
                    Text("This will help us curate a better \nexperience for you")
                        .font(.montserratRegular(size: 14))
                        .foregroundStyle(Color.customColor(code: 118))
                        .multilineTextAlignment(TextAlignment.center)
                }
                .padding(.top, 40)
                .padding(.bottom, 32)
                VStack(alignment: .leading, spacing: 24) {
                    RectangleView(imageName: "individual_ic", checkImage: isIndividualSelected ? "blue_check" : "blue_un_check" ,title: "Individual user", shortdesc: "I’m looking for flatmates, vacant \nspaces or brokers", bgColor: Color.bgPurple(), borderColor: isIndividualSelected ? Color.primaryPurple() : Color.clear, userType: .individual)
                        .onTapGesture {
                            isAgentSelected = false
                            isIndividualSelected = true
                        }
                    
                    RectangleView(imageName: "agent_ic", checkImage: isAgentSelected ? "green_check" : "green_uncheck" ,title: "Real estate agent", shortdesc: "I want to myself as a broker", bgColor: Color.bgAgent(), borderColor: isAgentSelected ? Color.agentBorder() : Color.clear, userType: .agent)
                        .frame(height: 180)
                        .onTapGesture {
                            isIndividualSelected = false
                            isAgentSelected = true
                        }
                }
                .padding([.leading, .trailing], 20)
                Spacer()
                if showNextBtn {
                    SubmitButtonView(title: "Next") {
                        router.navigate(to: .landingIntro)
                    }
                    .frame(height: 44)
                    .padding([.leading, .trailing, .bottom], 20)
                }
            }
            .onChange(of: isIndividualSelected) { oldValue, newValue in
                if newValue {
                    showNextBtn = true
                }
            }
            .onChange(of: isAgentSelected) { oldValue, newValue in
                if newValue {
                    showNextBtn = true
                } 
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WelcomeView()
}

struct RectangleView: View {
    
    @State var imageName: String?
    var checkImage: String?
    @State var title: String?
    @State var shortdesc: String?
    @State var bgColor: Color?
    var borderColor: Color?
    @State var userType: UserType = .individual
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment:.leading, spacing: 5) {
                    Image(imageName ?? "")
                        .frame(width: 64, height: 64)
                        .padding(.top, 20)
                        .padding(.bottom, 11)
                    Text(title ?? "")
                        .font(.montserratBold(size: 20))
                        .foregroundStyle(userType == .agent ? Color.agentTextColor() : Color.individualTextColor())
                    Text(shortdesc ?? "")
                        .font(.montserratMedium(size: 14))
                        .foregroundStyle(userType == .agent ? Color.agentTextColor() : Color.individualTextColor())
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
                
                Spacer()
                Image(checkImage ?? "")
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
            }
        }
        .frame(height: 180)
        .background(bgColor.cornerRadius(8))
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor ?? Color.clear, lineWidth: 1)
            )
    }
}
