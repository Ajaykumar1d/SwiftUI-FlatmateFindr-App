//
//  NavigationRouter.swift
//  ACCompany
//
//  Created by Thangarajan K on 13/06/24.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {

    public enum Destination: Codable, Hashable {
        case otp
        case registerSuccess
        case intro
        case landingPage
        case landingIntro
        case list
        case search
        case gender
        case aboutyou
        case phoneview
        case work
        case cityview
        case locationview
        case budget
        case profileUpdate
        case profieSuccess
        case home
        case houseprefer
        case myabout
        case habit
        case moreabout
        case getName
        case getAge
    }

    @Published var navigationPath = NavigationPath()

    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }

    func navigateBack() {
        navigationPath.removeLast()
    }

    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
