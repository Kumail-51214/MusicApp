//
//  OnboardingData.swift
//  WallsPy
//
//  Created by Daniyal.Shafiq on 15/03/2024.
//

import Foundation

enum OnboardingData : CaseIterable{
    case feature1, feature2, featrure3
    
    var iconName: String {
        switch self {
        case .feature1:
            return "screen_onboarding_one"
        case .feature2:
            return "screen_onboarding_two"
        case .featrure3:
            return "screen_onboarding_three"
        }
    }
    
    var headingText: String {
        switch self {
        case .feature1:
            return "Exclusive Sounds"
        case .feature2:
            return "Relax sleep sounds"
        case .featrure3:
            return "Story for kids"
        }
    }
    
    var descriptionText: String {
        switch self {
        case .feature1:
            return "We have an author's library of sound that \n you will not find else where"
        case .feature2:
            return "Our sound will help to relax and improve \n your sleep health"
        case .featrure3:
            return "Famous fairy tales with soothing sound will \n help your children fall asleep faster"
        }
    }
    
}
