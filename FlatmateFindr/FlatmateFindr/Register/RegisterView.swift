//
//  Register.swift
//  ACCompany
//
//  Created by Thangarajan K on 12/06/24.
//

import SwiftUI

extension Constants {
    static let termsText = "By tapping Get started, you agree to the"
    static let agreementText = "Terms & Conditions"
    static let sendotp = "Send OTP"
}

struct RegisterView: View {
    @State var termsView = false
    @State var otpNavigation = false
    @State var sendOtpBtnEnabled = false
    @State var mobileNumber: String?
    
    @ObservedObject var router = NavigationRouter()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            ZStack {
                Color.white
                    .onTapGesture {
                        hideKeyboard()
                    }
                VStack(alignment: .leading, spacing: 20, content: {
                    NavigationBarView(title: "Sign In", backButton: false, backButtonAction: {
                        
                    })
                    .padding(.top, 16)
                    .padding(.leading, -20)
                    .padding(.trailing, -20)
                    Text("Enter your phone \nnumber")
                        .font(.montserratBold(size: 24))
                    Text("We use your mobile number to identify \nyour account")
                        .font(.montserratRegular(size: 16))
                    BorderView(title: "Phone number", textValue: $mobileNumber, placeholder: "8888888888")
                        .frame(height: 64)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(Constants.termsText)
                            .font(Font.montserratRegular(size: 12))
                        NavigationLink(destination: TermsAndConditionView()) {
                            Text(Constants.agreementText)
                                .font(Font.montserratRegular(size: 12))
                                .foregroundStyle(Color.purbleColor())
                                .frame(height: 30)
                                .underline()
                        }
                    }
                    
                    Spacer()
                    SubmitButtonView(title: Constants.sendotp, submitButtonAction: {
                        router.navigate(to: .otp)
                    })
                    .disabled(!sendOtpBtnEnabled)
                    .frame(height: 44)
                    .padding(.bottom, 20)
                })
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .onChange(of: (mobileNumber ?? ""), { oldValue, newValue in
                DispatchQueue.main.async {
                    sendOtpBtnEnabled = newValue.count == 10 ? true : false
                }
            })
            .navigationDestination(for: NavigationRouter.Destination.self) { destination in
                switch destination {
                case .otp:
                    VerifyOtpView(mobileNumber: mobileNumber)
                        .environmentObject(router)
                case .registerSuccess:
                    RegisterSuccessView()
                        .environmentObject(router)
                case .intro:
                    OnboardPageView()
                        .environmentObject(router)
                case .landingPage:
                    WelcomeView()
                        .environmentObject(router)
                case .landingIntro: 
                     LandingIntroView()
                        .environmentObject(router)
                case .aboutyou:
                    AboutYouView()
                        .environmentObject(router)
                case .phoneview:
                    PhoneNumVisibleView()
                        .environmentObject(router)
                case .work:
                    WorkdetailsView()
                        .environmentObject(router)
                case .cityview:
                    CitySelectionView()
                        .environmentObject(router)
                case .locationview:
                    LocationSelectionView()
                        .environmentObject(router)
                case .profileUpdate:
                    ProfileUpdateView()
                        .environmentObject(router)
                case .profieSuccess:
                    CreatedProfileView()
                        .environmentObject(router)
                case .budget:
                    BudgetSelectionView()
                        .environmentObject(router)
                case .gender:
                    GenderView()
                        .environmentObject(router)
                case .home:
                    Home()
                        .environmentObject(router)
                case .houseprefer:
                    HousePreferencesView()
                        .environmentObject(router)
                case .myabout:
                    MyProfileAboutview()
                        .environmentObject(router)
                case .habit:
                    HabitView()
                        .environmentObject(router)
                case .moreabout:
                    MoreAboutyouView()
                case .getName:
                    GetNameView()
                        .environmentObject(router)
                case .getAge:
                    GetAgeView()
                        .environmentObject(router)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
