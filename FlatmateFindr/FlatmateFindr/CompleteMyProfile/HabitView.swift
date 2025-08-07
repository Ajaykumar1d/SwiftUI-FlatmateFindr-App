//
//  HabitView.swift
//  ACCompany
//
//  Created by product minmini on 20/06/24.
//

import SwiftUI

extension Constants {
    static let personalhabits = "Help us with your\npersonal habits"
    static let smoking = "Smoking"
    static let drinking = "Drinking"
    static let houseParty = "House Party"
}

struct HabitView: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var smokingListselectedItems = [String]()
    @State private var drinkingListselectedItems = [String]()
    @State private var housePartylistselectedItems = [String]()
    
    @State var smokingList = ["Regularly", "Socially", "Rarely", "Never"]
    @State var drinkingList = ["Regularly", "Socially", "Sikh", "Rarely", "Never"]
    @State var housePartyList = ["Frequently", "Don’t mind sometimes", "Rarely", "Never"]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                NavigationProgressView(title: Constants.personalhabits){
                    router.navigateBack()
                }.padding(.bottom, 24)
                VStack(spacing: 64){
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.smoking)
                            .font(.montserratMedium(size: 12))
                            .foregroundStyle(Color.gray87())
                        DynamicCollectionlistView(list: smokingList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                smokingListselectedItems = value
                            }
                        })
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.drinking)
                            .font(.montserratMedium(size: 12))
                            .foregroundStyle(Color.gray87())
                        DynamicCollectionlistView(list: drinkingList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                drinkingListselectedItems = value
                            }
                        })
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.houseParty)
                            .font(.montserratMedium(size: 12))
                            .foregroundStyle(Color.gray87())
                        DynamicCollectionlistView(list: housePartyList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                housePartylistselectedItems = value
                            }
                        })
                    }
                    
                    
                }
                .padding(.bottom, 74)
            }
           
            DoubleButtonView(firsttitle: Constants.back, secondtitle: Constants.next) {
                router.navigateBack()
            } secondButtonAction: {
                router.navigate(to: .moreabout)
            }
            
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    HabitView()
}
