//
//  MoreAboutyouView.swift
//  ACCompany
//
//  Created by product minmini on 20/06/24.
//

import SwiftUI

extension Constants {
    static let moreabout = "Let us know more about\nyou"
    static let havevisitors = "Do you have visitors?"
    static let bringpets = "Will you bring pets?"
    static let finish = "Finish"
}

struct MoreAboutyouView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var sliderPosition: ClosedRange<Int> = 0...100
    @State private var visitorsListselectedItems = [String]()
    @State private var petsListselectedItems = [String]()
    
    @State var visitorsList = ["Frequently", "Sometimes", "rarely", "Never"]
    @State var petsList = ["I don’t have pets", "My pet will stay with me", "I might bring my pet occasionally"]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                NavigationProgressView(title: Constants.moreabout){
                    router.navigateBack()
                }.padding(.bottom, 24)
                VStack(spacing: 64){
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.havevisitors)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: visitorsList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                visitorsListselectedItems = value
                            }
                        })
                    }
                    VStack(alignment: .leading,spacing:12) {
                        Text(Constants.bringpets)
                            .font(.montserratSemiBold(size: 14))
                        DynamicCollectionlistView(list: petsList, isLocation: true, isBudget: true, submitButtonAction:  {action in
                            if let value = action as? [String] {
                                petsListselectedItems = value
                            }
                        })
                    }
                 
                    
                    
                }
                .padding(.bottom, 100)
            }
           
            DoubleButtonView(firsttitle: Constants.back, secondtitle: Constants.finish) {
                
            } secondButtonAction: {
                
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    MoreAboutyouView()
}
