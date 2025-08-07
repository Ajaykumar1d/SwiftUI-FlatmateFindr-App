//
//  FlatmateCardView.swift
//  ACCompany
//
//  Created by Mohanraj on 16/06/24.
//

import SwiftUI


struct Flatmate: Identifiable {
    let id = UUID()
    let name: String
    let gender: String
    let age: Int
    let occupation: String
    let preferences: String
    let moveInTime: String
    let budget: Int
    let imageName: String
}

struct FlatmateCardView: View {
    let flatmate: Flatmate

    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                VStack() {
                    Image(flatmate.imageName)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(.rect)
                        .padding(.leading, 15)
                        .padding(.top, 15)
                    Spacer()
                }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(flatmate.name)
                                .font(.montserratBold(size: 14))
                                .lineLimit(1)
                            Spacer()
                            HStack {
                                Button(action: {
                                    
                                }) {
                                    Image("pointer")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 20, height: 20)
                                        .padding(.leading, 16)
                                }
                                .frame(width: 45)
                                
                                Button(action: {
                                    
                                }) {
                                    Image("save")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 18)
                                        .padding(.leading, 10)
                                }
                            }
                        }
                        HStack {
                            Text(flatmate.gender)
                                .font(.montserratRegular(size: 12))
                            Text("|")
                                .foregroundColor(.gray.opacity(0.5))
                            Text("\(flatmate.age)")
                                .font(.montserratRegular(size: 12))
                            Spacer()
                        }
                        HStack {
                            Image("luggage")
                                .resizable()
                                .frame(width: 12.4, height: 9.39)
                            Text(flatmate.occupation)
                                .font(.montserratRegular(size: 12))
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                }
                .padding()
            }
            HStack {
                Spacer()
                VStack {
                    Text("\(flatmate.preferences) | \(flatmate.moveInTime)")
                        .font(.montserratRegular(size: 12))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.top)
                        .padding(.bottom)
                }
                Spacer()
            }
            //.background(Color(.init(hex: "#F7F9FF")))
            Spacer()
            HStack() {
                Spacer()
                Text("Budget")
                    .font(.montserratMedium(size: 12))
                    .foregroundColor(.black)
                Text("\(flatmate.budget)")
                    .font(.montserratBold(size: 16))
                    .foregroundColor(.black)
                Text("/month")
                    .font(.montserratMedium(size: 12))
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct FlatmateCard: View {
    let flatmates = [
        Flatmate(name: "Rishabh Sharma", gender: "Male", age: 22, occupation: "Student", preferences: "Single Occupancy | Vegetarian", moveInTime: "In a week", budget: 5000, imageName: "rishabh"),
        Flatmate(name: "Rishika Sharma", gender: "Female", age: 24, occupation: "Working", preferences: "Single Occupancy | Vegetarian", moveInTime: "In a month", budget: 25000, imageName: "rishabh"),
        Flatmate(name: "Shivam Kale", gender: "Female", age: 24, occupation: "Working", preferences: "Single Occupancy | Vegetarian", moveInTime: "In a month", budget: 15000, imageName: "rishabh"),
        Flatmate(name: "Sharan Kumar", gender: "Male", age: 24, occupation: "Working", preferences: "Double Occupancy | Vegetarian", moveInTime: "Immediate", budget: 15000, imageName: "rishabh"),
        Flatmate(name: "Raajnandini Jadhav", gender: "Female", age: 24, occupation: "Student", preferences: "Double Occupancy | Non-Vegetarian", moveInTime: "In a month", budget: 17000, imageName: "rishabh")
    ]

    var body: some View {
//        VStack {
//            List(flatmates) { flatmate in
//                FlatmateCardView(flatmate: flatmate)
//                    .listRowInsets(EdgeInsets())
//            }
//        }
        
        ScrollView {
            ForEach(flatmates) { flatmate in
                FlatmateCardView(flatmate: flatmate)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateCard()
    }
}
