//
//  GenderView.swift
//  ACCompany
//
//  Created by product minmini on 14/06/24.
//

import SwiftUI

extension Constants {
    static let gentitle = "What is your gender?"
    static let gensubtitle = "please select your gender identity"
    static let male = "Male"
    static let female = "Female"
    static let nonBinary = "Non-binary"
    static let pronouns = "Your pronouns"
    static let invisible = "This will be visible on your profile"
    static let next = "Next"
}

struct GenderView: View {
    @EnvironmentObject var router: NavigationRouter
    @State var bottomview:Bool = false
    @State var bottobtn:Bool = false
    let list = [Constants.male, Constants.female, Constants.nonBinary]
    @State private var selectedIteam: String?
    @State private var pronoList: Bool?
    var body: some View {
        VStack(spacing: 32){
            VStack(spacing: 20){
                NavigationProgressView(title: Constants.gentitle, subtitle:Constants.gensubtitle){
                    router.navigateBack()
                }
                ForEach(list.indices, id: \.self) { index in
                    GenderListview(title: list[index], index: index, selectedItem: $selectedIteam)
                        .onTapGesture {
                            selectedIteam = list[index]
                            pronoList = index == 0 ? true:index == 1 ? false:nil
                            bottomview = index == 2 ? false:true
                            bottobtn = true
                        }
                }
            }
            if bottomview {
                VStack(spacing: 16){
                    PronounsList(list: $pronoList)
                    HStack(spacing:4){
                        Image("Eye")
                            .resizable()
                            .frame(width: 20,height: 14)
                        Text(Constants.invisible)
                            .font(.interRegular(size: 14))
                            .foregroundColor(Color.borderColor225())
                        Spacer()
                        
                    }
                    Spacer()
                }
            } else {
                HStack(spacing:4){
                    Image("Eye")
                        .resizable()
                        .frame(width: 20,height: 14)
                    Text(Constants.invisible)
                        .font(.interRegular(size: 14))
                        .foregroundColor(Color.borderColor225())
                    Spacer()
                    
                }
                Spacer()
            }
            if bottobtn {
                SubmitButtonView(title: Constants.next) {
                    router.navigate(to: .aboutyou)
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
    GenderView()
}

struct GenderListview: View {
    let title: String
    let index: Int
    @Binding var selectedItem: String?
    var body: some View {
        HStack(spacing: 13, content: {
            if index == 0 ||  index == 1 {
                Image(index == 0 ? "male":"female")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.leading, 12)
                Text(title)
                    .font(.montserratMedium(size: 16))
                    .foregroundColor(selectedItem == title ? .purbleColor():.black)
                Spacer()
                
            } else {
                Text(title)
                    .font(.montserratMedium(size: 16))
                    .padding(.leading, 12)
                    .foregroundColor(selectedItem == title ? .purbleColor():.black)
                Spacer()
            }
            if selectedItem == title {
                Image("check_fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)
            }
        })
        .frame(height: 56)
        .background(
            RoundedRectangle(cornerRadius: 8).fill(selectedItem == title ? Color.purple4():.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(selectedItem == title ? .purbleColor():Color.borderColor225(), lineWidth: 1)
        )
    }
}

struct PronounsList:View {
    private let malelist = ["He/Him", "They/Them", "Himself"]
    private let femalelist = ["She/her", "They/Them", "Herself"]
    @Binding var list: Bool?
    @State private var selectedIteam: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Constants.pronouns)
                .font(.montserratBold(size: 20))
            HStack(spacing: 12) {
                ForEach(list ?? true ? malelist:femalelist, id: \.self) { item in
                    Text(item)
                        .font(.montserratMedium(size: 14))
                    
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .frame(height: 32)
                        .foregroundColor(selectedIteam == item ? .purbleColor():Color.black)
                        .background(
                            RoundedRectangle(cornerRadius: 16).fill(selectedIteam == item ? .purple2() : Color.clear)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(selectedIteam == item ? .purbleColor():Color.borderColor225(), lineWidth: 1))
                        .onTapGesture {
                            selectedIteam = item
                        }
                }
                Spacer()
                
            }
           
            HStack {
                Text("Other")
                    .font(.montserratRegular(size: 14))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .onTapGesture {
                    selectedIteam = "Other"
                }
                
            }
            .frame(height: 32)
            .foregroundColor(selectedIteam == "Other" ? .purbleColor():Color.black)
            .background(
                RoundedRectangle(cornerRadius: 16).fill(selectedIteam == "Other" ? .purple2() : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(selectedIteam == "Other" ? .purbleColor():Color.borderColor225(), lineWidth: 1))
        }
    }
}
