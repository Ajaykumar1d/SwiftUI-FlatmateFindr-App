//
//  SubmitButtonView.swift
//  ACCompany
//
//  Created by Thangarajan K on 13/06/24.
//

import SwiftUI

struct SubmitButtonView: View {
    @State var title: String = "Submit"
    var submitButtonAction: ()->Void?
    
    var body: some View {
        ZStack {
            Color.purbleColor()
            Text(title)
                .foregroundStyle(Color.white)
                .font(.montserratSemiBold(size: 16))
        }
        .onTapGesture(perform: {
            submitButtonAction()
        })
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SubmitButtonView(submitButtonAction: {
        
    })
}
