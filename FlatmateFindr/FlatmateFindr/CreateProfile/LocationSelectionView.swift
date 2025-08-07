//
//  LocationSelectionView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

extension Constants {
    static let loctiltle = "What are your\npreferred localities?"
    static let locsubtitle = "You can select up to 5 localities"
    static let locplaceholder = "Search localities"
    static let loclisttitle = "Popular localities in Mumbai"
}

struct LocationSelectionView: View {
    @EnvironmentObject var router: NavigationRouter
    private var dummyList = ["Bandra", "Juhu", "Andheri E", "Andheri W", "Oshiwara", "Jogeshwari"]
    @State private var searchText: String = ""
   @State private var selectedItems = [String]()
    
    var body: some View {
        VStack(spacing: 0){
            NavigationProgressView(title: Constants.loctiltle, subtitle:Constants.locsubtitle){
                router.navigateBack()
            }
            SearchView(placeholder: Constants.locplaceholder, searchValue: $searchText)
                .frame(height: 40)
                .onTapGesture(perform: {
                })
                .padding(.top, 32)
            VStack(alignment:.leading,spacing:8) {
                Text(Constants.loclisttitle)
                    .font(.montserratRegular(size: 14))
                    .foregroundStyle(Color.borderColor225())
                DynamicCollectionlistView(list: dummyList, isLocation: true, submitButtonAction:  {action in
                    if let value = action as? [String] {
                        selectedItems = value
                    }
                })
               
            }
            .padding(.top, 16)
            Spacer()
            if !selectedItems.isEmpty {
                SubmitButtonView(title: Constants.next) {
                    router.navigate(to: .budget)
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
    LocationSelectionView()
}
