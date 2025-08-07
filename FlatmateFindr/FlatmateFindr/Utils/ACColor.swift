//
//  ACColor.swift
//  ACCompany
//
//  Created by Thangarajan K on 12/06/24.
//

import Foundation
import SwiftUI

extension Color {
    static func borderColor225() -> Color {
        Color(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0).opacity(1)
    }
    static func Color125() -> Color {
        Color(red: 125.0/255.0, green: 125.0/255.0, blue: 125.0/255.0).opacity(1)
    }
    static func purbleColor() -> Color {
        Color(red: 71.0/255.0, green: 74.0/255.0, blue: 174/255.0).opacity(1)
    }
    static func Color75() -> Color {
        Color(red: 75.0/255.0, green: 75.0/255.0, blue: 75.0/255.0).opacity(1)
    }
    static func Color249() -> Color {
        Color(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0).opacity(1)
    }
    static func Color218() -> Color {
        Color(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0).opacity(1)
    }
    
    static func primaryPurple() -> Color {
        Color(red: 71.0/255.0, green: 74.0/255.0, blue: 174.0/255.0).opacity(1)
    }
    
    static func bgPurple() -> Color {
        Color(red: 19.0/255.0, green: 22.0/255.0, blue: 70.0/255.0).opacity(1)
    }

    static func purple4() -> Color {
        Color(red: 235/255.0, green: 236/255.0, blue: 251/255.0).opacity(1)
    }
    static func purple2() -> Color {
        Color(red: 179/255.0, green: 183/255.0, blue: 238/255.0).opacity(1)
    }
    static func gray4() -> Color {
        Color(red: 211/255.0, green: 211/255.0, blue: 211/255.0).opacity(1)
    }
    static func gray11() -> Color {
        Color(red: 179/255.0, green: 179/255.0, blue: 179/255.0).opacity(1)
    }
    static func gray7() -> Color {
        Color(red: 218/255.0, green: 218/255.0, blue: 218/255.0).opacity(1)
    }
    static func gray2() -> Color {
        Color(red: 249/255.0, green: 249/255.0, blue: 249/255.0).opacity(1)
    }

    static func bgAgent() -> Color {
        Color(red: 19.0/255.0, green: 51.0/255.0, blue: 0.0/255.0).opacity(1)
    }
    
    static func agentBorder() -> Color {
        Color(red: 100.0/255.0, green: 161.0/255.0, blue: 11.0/255.0).opacity(1)
    }
    
    static func individualTextColor() -> Color {
        Color(red: 181.0/255.0, green: 182.0/255.0, blue: 220.0/255.0).opacity(1)
    }
    
    static func agentTextColor() -> Color {
        Color(red: 175.0/255.0, green: 201.0/255.0, blue: 141.0/255.0).opacity(1)
    }
    
    static func appBlack() -> Color {
        Color.customColorRGB(r: 2, g: 0, b: 8)
    }
    
    static func gray87() -> Color {
        Color.customColorRGB(r: 87, g: 87, b: 86)
    }
    static func customColor(code: CGFloat) -> Color {
        Color.customColorRGB(r: code, g: code, b: code)
    }
    
    static func customColorRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> Color {
        Color(red: r/255.0, green: g/255.0, blue: b/255.0).opacity(1)
    }
}
