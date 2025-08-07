//
//  EllipseForwardView.swift
//  ACCompany
//
//  Created by Thangarajan K on 20/06/24.
//

import SwiftUI

struct EllipseForwardView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("ellipse")
            Image("arrow-forward")
                .padding(.bottom, 7)
                .padding(.leading, 14)
        }
    }
}

#Preview {
    EllipseForwardView()
}
