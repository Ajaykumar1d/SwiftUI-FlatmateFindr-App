//
//  LocationSearchView.swift
//  ACCompany
//
//  Created by Mohanraj on 16/06/24.
//

import SwiftUI

struct LocationSearchView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack {
                Image("location")
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Pune")
                        .font(.montserratBold(size: 14))
                        .foregroundColor(.black)
                    
                    Text("Viman Nagar, Wadgaonsheri, K...")
                        .font(.montserratRegular(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }
            .frame(width: 260, height: 60)
            .padding(.trailing)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(25)
            
            Button(action: {
                // Action for search button
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(25)
            }
        }
    }
}

#Preview {
    LocationSearchView()
}
