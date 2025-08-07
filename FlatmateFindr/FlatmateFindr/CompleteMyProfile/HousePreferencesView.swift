//
//  HousePreferencesView.swift
//  ACCompany
//
//  Created by product minmini on 20/06/24.
//

import SwiftUI

extension Constants {
    static let housepreference = "Select your housing\npreferences"
    static let duration = "Duration"
    static let inMonths = "In Months"
    static let possession  = "Possession"
    static let occupancy = "Occupancy"
    static let back  = "Back"
}

struct HousePreferencesView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var sliderPosition: ClosedRange<Int> = 0...100
    @State private var durationListselectedItems = [String]()
    @State private var possessionListselectedItems = [String]()
    @State private var occupancylistselectedItems = [String]()
    
    @State var durationList = ["1 Months", "1-3 Months", "4-6 Months", "6-12 Months", "1 Year+"]
    @State var possessionList = ["Immediate", "Within a week", "Within a month", "After a month"]
    @State var occupancylist = ["Single", "Double", "Other"]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 64){
                    VStack(spacing:24) {
                        NavigationProgressView(title: Constants.housepreference){
                            router.navigateBack()
                        }
                        VStack(spacing:12) {
                            HStack(spacing: 3) {
                                Text(Constants.budgetrange)
                                    .font(.montserratSemiBold(size: 16))
                                Text(Constants.permonthrent)
                                    .font(.montserratRegular(size: 14))
                                Spacer()
                            }
                            RangedSliderView(value: $sliderPosition, bounds: 0...100)
                                .frame(height: 48)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                    
                    VStack(alignment: .leading,spacing:0) {
                        Text(Constants.duration)
                            .font(.montserratSemiBold(size: 14))
                        Text(Constants.inMonths)
                            .font(.montserratRegular(size: 12))
                            .foregroundStyle(Color.borderColor225())
                            .padding(.top,4)
                        
                        DynamicCollectionlistView(list: durationList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                durationListselectedItems = value
                            }
                        })
                        .padding(.top,12)
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.possession)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: possessionList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                possessionListselectedItems = value
                            }
                        })
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.occupancy)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: occupancylist, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                occupancylistselectedItems = value
                            }
                        })
                    }
                    
                   
                }
                .padding(.bottom, 40)
                
            }
            
            DoubleButtonView(firsttitle: Constants.back, secondtitle: Constants.next) {
                router.navigateBack()
            } secondButtonAction: {
                router.navigate(to: .myabout)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    HousePreferencesView()
}
