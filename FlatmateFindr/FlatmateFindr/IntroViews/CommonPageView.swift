//
//  CommonPageView.swift
//  ACCompany
//
//  Created by Ajaykumar D on 13/06/24.
//

import SwiftUI

struct CommonPageView: View {
    @EnvironmentObject var coordinator: OnboardCoordinator
    @EnvironmentObject var router: NavigationRouter
    
    let image: String
    let title: String
    let subtitle: String
    let skipbtn: String
    let nextbtn: String
    var skip: Bool = true
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                Image(image)
                Text(title)
                    .foregroundStyle(Color.Color249())
                    .font(.montserratBold(size: 20))
                    .multilineTextAlignment(.center)
                Text(subtitle)
                    .font(.montserratRegular(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.Color249())
                Spacer()
                HStack(spacing: 30) {
                    if skip {
                        Button(action: {
                            router.navigate(to: .landingPage)
                        }) {
                            Text(skipbtn)
                                .underline()
                                .foregroundColor(.white)
                                .font(.montserratSemiBold(size: 16))
                        }
                        .padding(.leading, 20)
                    }
                    SubmitButtonView(title: nextbtn) {
                        if coordinator.currentPage < coordinator.pages.count - 1{
                            coordinator.moveToNextPage()
                        } else {
                            router.navigate(to: .landingPage)
                        }
                    }
                    .frame(height: 44)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 44)
            }
        }
    }
}

struct PagingIndicator: View {
    var activeTint: Color
    var inactiveTint: Color
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? activeTint : inactiveTint)
                    .frame(width: index == currentPage ? 25 : 10, height: 10)
                    .overlay {
                        ZStack {
                            Capsule()
                                .fill(inactiveTint)
                            if index == currentPage {
                                Capsule()
                                    .fill(activeTint)
                            }
                        }
                    }
            }
        }
        .frame(height: 20)
    }
}



class OnboardCoordinator: ObservableObject {
    let pages: [CommonPageView]
    @Binding var currentPage: Int
    init(pages: [CommonPageView], currentPage: Binding<Int>) {
        self.pages = pages
        self._currentPage = currentPage
    }
    
    func moveToNextPage() {
        if currentPage < pages.count - 1 {
            withAnimation {
                currentPage += 1
            }
        }
    }
}
