//
//  VerifyOtpView.swift
//  ACCompany
//
//  Created by Thangarajan K on 13/06/24.
//

import SwiftUI

extension Constants {
    static let enterOtp = "Enter OTP"
    static let otptext1 = "Enter the code we sent \nyou"
    static let otptext2 = "We’ve sent you an SMS to"
    static let smsCode = "SMS code"
    static let smsCodePlaceholder = "000 000"
    static let otptext3 = "Your 6 digit code is on its way. This can sometimes take a few moments to arrive."
    static let resendCode = "Resend code"
    static let verify = "Verify"
}

struct VerifyOtpView: View {
    @State var mobileNumber: String?
    @State var otp: String?
    @EnvironmentObject var router: NavigationRouter
    @State var termsView = false
    var body: some View {
        ZStack {
            Color.white
                .onTapGesture {
                    hideKeyboard()
                }
            VStack(alignment: .leading, spacing: 20, content: {
                NavigationBarView(title: Constants.enterOtp, backButtonAction: {
                    router.navigateBack()
                })
                .padding(.leading, -34)
                .padding(.trailing, -20)
                Text(Constants.otptext1)
                    .font(.montserratBold(size: 24))
                Text(Constants.otptext2 +  " \n+91 " + (mobileNumber ?? "9786542311"))
                    .font(.montserratRegular(size: 16))
                BorderView(title: Constants.smsCode, textValue: $otp, placeholder: Constants.smsCodePlaceholder, textFieldType: .sms)
                    .frame(height: 64)
                VStack(alignment: .trailing, spacing: 16) {
                    Text(Constants.otptext3)
                        .font(Font.interRegular(size: 12))
                    Text(Constants.resendCode)
                        .font(Font.interSemiBold(size: 16))
                        .foregroundStyle(Color.purbleColor())
                        .frame(height: 30)
                        .underline()
                        .onTapGesture {
                            //Resend otp action
                        }
                }
                
                Spacer()
                SubmitButtonView(title: Constants.verify, submitButtonAction: {
                    router.navigate(to: .registerSuccess)
                })
                .frame(height: 44)
                .padding(.bottom, 20)
            })
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    VerifyOtpView()
}
