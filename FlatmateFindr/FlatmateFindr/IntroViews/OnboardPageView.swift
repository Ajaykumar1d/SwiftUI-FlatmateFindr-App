//
//  OnboardPageView.swift
//  ACCompany
//
//  Created by Ajaykumar D on 13/06/24.
//

import SwiftUI

struct OnboardPageView: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var views: [CommonPageView] = [
        CommonPageView(image: "intro1", title: "Connect with Your \n Ideal Flatmate", subtitle: "Discover perfect flatmates with Accompany.\nShare your preferences, and we'll find a\nprefect match for you.", skipbtn: "SKIP",nextbtn:"NEXT"),
        CommonPageView(image: "intro2", title: "Discover \n Vacant Spaces", subtitle: "Explore pre-occupied spaces that match your\nneeds.Find a home shared with\nlike-minded individuals.", skipbtn: "SKIP",nextbtn:"NEXT"),
        CommonPageView(image: "intro3", title: "Find Your Trusted Real\nEstate Broker", subtitle: "Access a comprehensive directory of\nreliable real estate agents.", skipbtn: "SKIP",nextbtn:"Get Started")
    ]
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack{
            Color.black
            VStack(spacing: -50) {
                PagingIndicator(
                    activeTint: .white,
                    inactiveTint: .gray,
                    currentPage: $currentPage
                ).padding(.top, 30)
                
                TabView(selection: $currentPage) {
                    ForEach(views.indices, id: \.self) { index in
                        views[index]
                            .environmentObject(OnboardCoordinator(pages: views, currentPage: $currentPage))
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardPageView()
}

