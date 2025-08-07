//
//  CitySelectionView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

extension Constants {
    static let citytitle = "Which city are you\nlooking for?"
    static let citysubtitle = "This will help us curate your feed better"
    static let cityplaceholder = "Search city"
    static let popularcities = "Popular cities"
    static let showMore = "Show More"
}

struct CitySelectionView: View {
    
    @EnvironmentObject var router: NavigationRouter
    @State private var searchText: String = ""
    let cityList = ["Mumbai", "Pune", "Bangalore", "Delhi", "Hyderabad", "Chennai"]
    private var dummyList = ["Mumbai", "Mumbra", "Muffazarnagar", "Malad"]
    @State var showlist:Bool = false
    @State var bpttombtn:Bool = false
    @State private var selectedIteam:String = ""
    
    var body: some View {
        VStack(spacing: 0){
            NavigationProgressView(title: Constants.citytitle, subtitle:Constants.citysubtitle){
                router.navigateBack()
            }
            if bpttombtn {
                VStack {
                    HStack(spacing: 8) {
                        Text(selectedIteam)
                            .font(.interRegular(size: 14))
                            .foregroundStyle(.white)
                            .padding(.leading, 16)
                        Spacer()
                        Image("Cancel")
                            .resizable()
                            .frame(width: 14,height: 14)
                            .padding(.trailing, 16)
                            .onTapGesture(perform: {
                                selectedIteam = ""
                                bpttombtn.toggle()
                                showlist = false
                            })
                        
                    }
                    .frame(height: 40)
                    .background(Color.purbleColor()).cornerRadius(8)
                    Spacer()
                    SubmitButtonView(title: Constants.next) {
                        router.navigate(to: .locationview)
                    }
                    .frame(height: 44)
                    .padding(.bottom, 20)
                }
                .padding(.top, 32)
            } else {
                
                VStack(spacing:0){
                    SearchView(placeholder: Constants.cityplaceholder, searchValue: $searchText)
                        .frame(height: 40)
                        .onTapGesture(perform: {
                            showlist = true
                        })
                    if showlist {
                        List(dummyList.indices, id: \.self) { index in
                            HStack {
                                Text(dummyList[index])
                                    .font(.montserratRegular(size: 14))
                                Spacer()
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0).fill(Color.white)
                            )
                            .onTapGesture(perform: {
                                self.selectedIteam = dummyList[index]
                                bpttombtn.toggle()
                            })
                        }
                        .frame(height: CGFloat(dummyList.count) * 44)
                        .listStyle(.plain)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(showlist ? .black:.white, lineWidth: 1)
                )
                .padding(.top, 32)
                VStack(alignment:.leading,spacing:8) {
                    Text(Constants.popularcities)
                        .font(.montserratRegular(size: 14))
                        .foregroundStyle(Color.borderColor225())
                    DynamicCollectionlistView(list: cityList) {action in
                        if let value = action as? String {
                            self.selectedIteam = value
                            bpttombtn.toggle()
                        }
                    }
                    
                }
                .padding(.top, 16)
                Spacer()
            }
                
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CitySelectionView()
}








