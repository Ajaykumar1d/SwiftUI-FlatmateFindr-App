//
//  MyProfileAboutview.swift
//  ACCompany
//
//  Created by product minmini on 20/06/24.
//

import SwiftUI

extension Constants {
    static let foodPreference = "Food Preference"
    static let religion = "Religion"
    static let languagesspeak = "Languages your speak"
    static let hometown = "Hometown"
    static let hometownplaceholder = "e.g. Pune"
}

struct MyProfileAboutview: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var foodPreferenceListselectedItems = [String]()
    @State private var religionListselectedItems = [String]()
    @State private var languagesspeaklistselectedItems = [String]()
    
    @State var foodPreferenceList = ["Vegetarian", "Non-Vegetarian", "Eats Egg", "Vegan ☘️", "Jain", "Other"]
    @State var religionList = ["Hindu", "Muslim", "Sikh", "Jain", "Christian", "Zoroastrian", "Other"]
    @State var languagesspeak = ["Hindi", "Marathi", "English", "Pujabi", "Other"]
    @State var text:String?
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                NavigationProgressView(title: Constants.personalhabits){
                    router.navigateBack()
                }.padding(.bottom, 53)
                VStack(spacing: 64){
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.foodPreference)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: foodPreferenceList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                foodPreferenceListselectedItems = value
                            }
                        })
                    }
                    
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.religion)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: religionList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                religionListselectedItems = value
                            }
                        })
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.languagesspeak)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: languagesspeak, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                languagesspeaklistselectedItems = value
                            }
                        })
                    }
                    VStack(alignment:.leading, spacing:12){
                        Text(Constants.hometown)
                            .font(.montserratSemiBold(size: 16))
                        BorderView(
                            title: Constants.hometown,
                            textValue: $text,
                            placeholder: Constants.hometownplaceholder,
                            textFieldType: .name
                        )
                        .frame(height: 56)
                    }
                    
                }
            }
            .padding(.bottom, 40)
            
            
            
            DoubleButtonView(firsttitle: Constants.back, secondtitle: Constants.next) {
                router.navigateBack()
            } secondButtonAction: {
                router.navigate(to: .habit)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    MyProfileAboutview()
}
