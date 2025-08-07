//
//  LandingIntroView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

struct LandingIntroView: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var currentPage: Int = 0
    @State private var views: [ImageView] = []

    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(views.indices, id: \.self) { index in
                    views[index]
                        .onTapGesture {
                            if index == 2 {
                                router.navigate(to: .getName)
                            } else {
                                withAnimation {
                                    currentPage += 1
                                }
                            }
                        }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
        .onAppear {
            views = [ImageView(imageName: "landingIntro1", currentPage: $currentPage), ImageView(imageName: "landingIntro2", currentPage: $currentPage), ImageView(imageName: "landingIntro3", currentPage: $currentPage)]
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LandingIntroView()
}

struct ImageView: View {
    @State var imageName: String?
    @Binding var currentPage: Int
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        ZStack {
            Image(imageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                Spacer()
                HStack {
                    Button {
                        if currentPage == 0 {
                            router.navigateBack()
                        } else {
                            withAnimation {
                                currentPage -= 1
                            }
                        }
                    } label: {
                        Text("BACK")
                            .font(.montserratBold(size: 16))
                            .foregroundStyle(Color.white)
                    }.padding(.leading, 20)

                    Spacer()
                    EllipseForwardView()
                        .padding(.trailing, 10)
                }
                .padding(.bottom, 80)
            }
        }
    }
}
