//
//  CreteProfileView.swift
//  ACCompany
//
//  Created by product minmini on 13/06/24.
//

import SwiftUI

struct CreteProfileView: View {
    var body: some View {
        CommonPageView(image: "Profile Interface-pana 1", title: "Let's quickly create a\nprofile for to be found", subtitle: "this profile will be visible to others who are\nalso looking for a flatmate", skipbtn: "SKIP",nextbtn:"+ Create Profile", skip:false)
    }
}

#Preview {
    CreteProfileView()
}
