//
//  BudgetSelectionView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI


extension Constants {
    static let budgettitle = "What is your Budget"
    static let budgetsubtitle = "We can show you profiles with similar budget"
    static let budgetrange = "Budget range"
    static let permonthrent = "(Per month rent)"
    static let suggestions = "Suggestions"
    static let done = "Done"
    
}



struct BudgetSelectionView: View {
    @EnvironmentObject var router: NavigationRouter
    private var dummyList = ["Upto ₹20,000", "Upto ₹30,000", "Upto ₹35,000", "Any"]
    @State private var selectedItems = [String]()
    
    @State var sliderPosition: ClosedRange<Int> = 0...100
    var body: some View {
        VStack(spacing: 0){
            NavigationProgressView(title: Constants.budgettitle, subtitle:Constants.budgetsubtitle){
                router.navigateBack()
            }
            VStack(spacing:12) {
                HStack {
                    Text(Constants.budgetrange)
                        .font(.montserratSemiBold(size: 14))
                    Text(Constants.permonthrent)
                        .font(.montserratRegular(size: 14))
                    Spacer()
                }
                RangedSliderView(value: $sliderPosition, bounds: 0...100)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .padding(.top, 32)
            
            VStack(alignment:.leading,spacing:8) {
                Text(Constants.suggestions)
                    .font(.montserratRegular(size: 14))
                    .foregroundStyle(Color.borderColor225())
                DynamicCollectionlistView(list: dummyList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                    if let value = action as? [String] {
                        selectedItems = value
                    }
                })
            }
            .padding(.top, 16)
            Spacer()
            if !selectedItems.isEmpty {
                SubmitButtonView(title: Constants.done) {
                    router.navigate(to: .profileUpdate)
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
    BudgetSelectionView()
}
