//
//  WorkdetailsView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

extension Constants {
    static let worktitle = "What do you do?"
    static let worksubtitle = "So that we can showcase similar\npeople on your feed"
    static let student = "Student"
    static let freelancer = "Freelancer"
    static let professional = "Working Professional"
    static let company = "Company"
    static let other = "Other"
    static let unititle = "University Name"
    static let uniplaceholder = "e.g. Mithibai College"
    static let university = "University"
    static let companyname = "Company Name"
    static let companyplaceholder = "e.g. J.P. Morgan Chase"
}


struct WorkdetailsView: View {
    
    @EnvironmentObject var router: NavigationRouter
    @State var bottomBtn:Bool = false
    @State var textListView:Bool = true
    
    private var list = [Constants.student, Constants.freelancer, Constants.professional, Constants.other]
    
    private var dummyList = ["Mithibai College", "NMIMS Mumbai", "Atlas Skilltech University", "Amity University"]
    private var dummyList2 = ["J.P. Morgan Chase", "TCS", "Titan", "Zomato"]
    @State var selectedIteam: String  = ""
    @State var dummyListIteam: String = ""
    
    @State var text:String?
    
    var body: some View {
        VStack(spacing: 0){
            if textListView {
                NavigationProgressView(title: Constants.worktitle, subtitle:Constants.worksubtitle){
                    router.navigateBack()
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                    ForEach(list.indices, id: \.self) { index in
                        HStack {
                            Spacer()
                            Text(list[index])
                                .font(.montserratMedium(size: 16))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        
                        .frame(height: 64)
                        .foregroundColor(selectedIteam == list[index] ? .purbleColor():Color.black)
                        .background(
                            RoundedRectangle(cornerRadius: 16).fill(selectedIteam == list[index] ? .purple4() : Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(selectedIteam == list[index] ? .purbleColor():Color.borderColor225(), lineWidth: 1))
                        .padding(.horizontal, 4)
                        .onTapGesture(perform: {
                            selectedIteam = list[index]
                            bottomBtn = true
                        })
                        
                    }
                }
                .padding(.top, 32)
                if bottomBtn {
                    VStack(spacing:20) {
                        Text(selectedIteam == Constants.professional ? Constants.companyname : Constants.unititle)
                            .font(.montserratSemiBold(size: 20))
                        BorderView(
                            title: selectedIteam == Constants.companyname ? Constants.company : Constants.university,
                            textValue: $text,
                            placeholder: selectedIteam == Constants.companyplaceholder ? Constants.companyplaceholder : Constants.uniplaceholder,
                            textFieldType: .name,
                            borderColor: .borderColor225()
                        )
                        .frame(height: 64)
                        .onTapGesture(perform: {
                            textListView = false
                        })
                    }
                    .padding(.top, 24)
                }
                    HStack(spacing:4){
                        Image("Eye")
                            .resizable()
                            .frame(width: 20,height: 14)
                        Text(Constants.invisible)
                            .font(.interRegular(size: 14))
                            .foregroundColor(Color.borderColor225())
                        Spacer()
                }
                .padding(.top, 16)
                Spacer()
                
                if bottomBtn {
                    SubmitButtonView(title: Constants.next) {
                        router.navigate(to: .cityview)
                    }
                    .frame(height: 44)
                    .padding(.bottom, 20)
                }
            } else {
                
                HStack {
                    Text(selectedIteam == Constants.professional ? Constants.companyname : Constants.unititle)
                        .font(.montserratSemiBold(size: 20))
                    Spacer()
                }
                VStack(spacing: 0) {
                    BorderView(
                        title: selectedIteam == Constants.companyname ? Constants.company : Constants.university,
                        textValue: $text,
                        placeholder: Constants.uniplaceholder,
                        textFieldType: .name,
                        borderColor: .black
                    )
                        .frame(height: 64)
                        
                        .onTapGesture(perform: {
                            
                        })
                    List((selectedIteam == Constants.professional ? dummyList2 : dummyList).indices, id: \.self) { index in
                        HStack {
                            Text((selectedIteam == Constants.professional ? dummyList2 : dummyList)[index])
                                .font(.montserratRegular(size: 16))
                            Spacer()
                               
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 0).fill(Color.white)
                        )
                        .onTapGesture {
                            self.text = (selectedIteam == Constants.professional ? dummyList2 : dummyList)[index]
                            textListView = true
                        }
                    }
                    .frame(height: 176)
                    .listStyle(.plain)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
                    
                    
                }
                
                Spacer()
            }
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WorkdetailsView()
}
