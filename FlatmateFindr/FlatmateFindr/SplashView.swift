//
//  SplashView.swift
//  ACCompany
//
//  Created by Thangarajan K on 12/06/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                RegisterView()
            } else {
                VStack {
                    Spacer()
                    Image("logo_splash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 237, height: 135)
                    Spacer()
                    HStack {
                        Text("Find and")
                            .font(.montserratRegular(size: 24))
                        Text("be found.")
                            .font(.montserratItalic(size: 24))
                    }
                }
                
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

#Preview {
    SplashView()
}
