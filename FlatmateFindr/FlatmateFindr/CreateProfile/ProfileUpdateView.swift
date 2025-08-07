//
//  ProfileUpdateView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI


extension Constants {
    static let profiletitle = "Upload profile picture"
    static let profilesubtitle = "Profile photo builds trust and\nsparks connection with others in\nthe community."
    static let skipthis = "I’ll skip this"
    static let profilesetup = "Set up my profile"
    static let change = "CHANGE"
}

struct ProfileUpdateView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var isShowPicker: Bool = false
    @State var image: Image?
    @State var skip: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            NavigationProgressView(title: Constants.profiletitle, subtitle:Constants.profilesubtitle){
                router.navigateBack()
            }
            VStack(spacing:16) {
                ZStack {
                    Image("plus")
                        .onTapGesture(perform: {
                            withAnimation {
                                self.isShowPicker.toggle()
                                skip = true
                            }
                        })
                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180,height: 180)
                }
               
                .frame(width: 180,height: 180)
                .background(Color.purple4()).cornerRadius(16)
                if skip {
                    Text(Constants.change)
                        .font(.montserratBold(size: 16))
                        .foregroundColor(Color.purbleColor())
                        .underline()
                        .onTapGesture(perform: {
                            withAnimation {
                                self.isShowPicker.toggle()
                            }
                        })
                }
            }
            .padding(.top, 32)
            HStack(spacing:4){
                Image("Eye")
                    .resizable()
                    .frame(width: 20,height: 14)
                Text(Constants.invisible)
                    .font(.interRegular(size: 14))
                    .foregroundColor(Color.borderColor225())
        }
            .padding(.top, skip ? 24:64)
           
            Spacer()
            if !skip {
                Button {
                    router.navigate(to: .home)
                } label: {
                    Text(Constants.skipthis)
                        .font(.montserratBold(size: 16))
                        .foregroundColor(Color.purbleColor())
                        .underline()
                        .padding(.bottom, 20)
                }
            } else {
                SubmitButtonView(title: Constants.profilesetup) {
                    router.navigate(to: .profieSuccess)
                }
                .frame(height: 44)
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $isShowPicker) {
                        ImagePicker(image: self.$image)
                    }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileUpdateView()
}
