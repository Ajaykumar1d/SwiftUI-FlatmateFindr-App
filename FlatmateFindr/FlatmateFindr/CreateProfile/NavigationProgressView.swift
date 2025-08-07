//
//  NavigationProgressView.swift
//  ACCompany
//
//  Created by product minmini on 14/06/24.
//

import SwiftUI

struct NavigationProgressView: View {
    @State var title: String = ""
    @State var subtitle: String = ""
    var backButtonAction: ()-> Void?
    var body: some View {
        VStack(spacing:32, content: {
                HStack(spacing: 32, content: {
                    Button(action: {backButtonAction()}, label: {
                        Image("backArrow2")
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                    ProgressView(value: 25, total: 100)
                        .padding(.trailing, 70)
                    
                })
            VStack(alignment: .center, spacing: 12) {
                Text(title)
                    .font(.montserratBold(size: 24))
                    .multilineTextAlignment(.center)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.montserratRegular(size: 16))
                        .multilineTextAlignment(.center)
                }
            }
        })
    }
}

struct SearchView: View {
    @State var placeholder:String = ""
    @Binding var searchValue: String
    
    var body: some View {
        ZStack {
            HStack(spacing:8){
                Image("Search")
                    .resizable()
                    .frame(width: 16,height: 16)
                TextField(placeholder, text: $searchValue)
                    .font(.montserratRegular(size: 14))
            }
            .padding(12)
        }
        .background(Color.gray2()).cornerRadius(8)
    }
}
