//
//  Home.swift
//  ACCompany
//
//  Created by Mohanraj on 16/06/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedTab = "Flatmates"
       let tabs = ["Flatmates", "Vacancies"]
    var body: some View {
        VStack() {
            LocationSearchView()
            ScrollView {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Explore flatmates, flat")
                            .font(.montserratSemiBold(size: 20))
                        Text("vacancies & more")
                            .font(.montserratSemiBold(size: 20))
                    }
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                ZStack {
                    // LinearGradient background
//                    LinearGradient(
//                        gradient: Gradient(colors: [
//                            Color(hex: "#474AAE"),
//                            Color(hex: "#4770AE"),
//                            Color(hex: "#101265")
//                        ]),
//                        startPoint: .bottomTrailing,
//                        endPoint: .topLeading
//                    )
//                    .blur(radius: 1)
                    Color.primaryPurple()
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Start searching for a")
                                .font(.montserratRegular(size: 12))
                                .foregroundColor(.white)
                            Text("Flatmate")
                                .font(.montserratSemiBold(size: 14))
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        // Image on top of the gradient
                        Image("startsearchingflatmate") // Replace with your image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120) // Adjust size as needed
                    }
                }
                .frame(height: 120)
                .cornerRadius(15)
                .padding()
                
                HStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Flat")
                                .font(.montserratMedium(size: 14))
                                .foregroundColor(.black)
                            Text("Vacancies")
                                .font(.montserratMedium(size: 14))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(5)
                        // Image on top of the gradient
                        Image("Flat Vacancies") // Replace with your image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80) // Adjust size as needed
                    }
                    .frame(width: 170)
                    .background(Color(.white))
                    .cornerRadius(15)
                    .shadow(radius: 2)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Broker")
                                .font(.montserratMedium(size: 14))
                                .foregroundColor(.black)
                            Text("Directory")
                                .font(.montserratMedium(size: 14))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(5)
                        // Image on top of the gradient
                        Image("brokerdirectory") // Replace with your image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80) // Adjust size as needed
                    }
                    .frame(width: 170)
                    .background(Color(.white))
                    .cornerRadius(15)
                    .shadow(radius: 2)
                }
                .frame(height: 88)
                VStack(spacing: 20) {
                    // Profile Completion View
                    HStack {
                        CircularProgressView(progress: 0.7)
                            .frame(width: 50, height: 50)
                            .padding(.trailing)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Complete your profile now")
                                .font(.montserratSemiBold(size: 14))
                            Text("This will help us curate your feed better")
                                .font(.montserratRegular(size: 10))
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image("next")
                            .foregroundColor(.orange)
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(15)
                }
                .padding()
                VStack(spacing: 20) {
                            // Tab Selector
                            HStack {
                                ForEach(tabs, id: \.self) { tab in
                                    Button(action: {
                                        selectedTab = tab
                                    }) {
                                        Text(tab)
                                            .fontWeight(selectedTab == tab ? .bold : .regular)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(selectedTab == tab ? Color.purple2() : Color.clear)
                                            .cornerRadius(25)
                                            .foregroundColor(selectedTab == tab ? .black : .gray)
                                    }
                                }
                            }
                            .background(Color.white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding()
                        }
//                        .padding()
                FilterView()
                FlatmateCard()
                    .frame(height: 700)
            }
        }
    }
}

struct CircularProgressView: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6.0)
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.orange)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)

            Text(String(format: "%.0f %%", min(progress, 1.0) * 100.0))
                .font(.montserratMedium(size: 10))
                .bold()
                .foregroundColor(.gray)
        }
    }
}

struct FilterView: View {
    @State private var selectedPrice = "Any Price"
    @State private var showPriceOptions = false
    let filterOptions = ["Filters", "Any Price", "Female", "Standard"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filterOptions, id: \.self) { option in
                    if option == "Any Price" {
                        Menu {
                            Button("Any Price", action: { selectedPrice = "Any Price" })
                            Button("$", action: { selectedPrice = "$" })
                            Button("$$", action: { selectedPrice = "$$" })
                            Button("$$$", action: { selectedPrice = "$$$" })
                            // Add more options if needed
                        } label: {
                            HStack {
                                Text(selectedPrice)
                                   // .foregroundColor(.init(hex: "#1E1E1E"))
                                    .font(.montserratRegular(size: 12))
                                Image(systemName: "chevron.down")
                                    //.foregroundColor(.init(hex: "#1E1E1E"))
                            }
                            .padding()
                            .frame(height: 35)
                            .background(Color(.white))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    } else {
                        Button(action: {
                            // Action for other buttons
                        }) {
                            HStack {
                                if option == "Filters" {
                                    Image(systemName: "line.horizontal.3.decrease.circle")
                                        //.foregroundColor(.init(hex: "#1E1E1E"))
                                }
                                Text(option)
                                    //.foregroundColor(.init(hex: "#1E1E1E"))
                                    .font(.montserratRegular(size: 12))
                            }
                            .padding()
                            .frame(height: 35)
                            .background(Color(.white))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
        }
    }
}


#Preview {
    Home()
}
