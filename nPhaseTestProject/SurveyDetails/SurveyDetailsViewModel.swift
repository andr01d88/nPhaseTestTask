//
//  SurveyDetailsViewModel.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation

final class SurveyDetailsViewModel: BaseViewModel {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func getBasicInfo() -> [(String, String)] {
        return [
            (Strings.SurveyHistoryDetails.nameLabel, user.name),
            (Strings.SurveyHistoryDetails.ageLabel, "\(user.age)"),
            (Strings.SurveyHistoryDetails.emailLabel, user.email)
        ]
    }
    
    func getInterests() -> [String] {
        return user.interests.map { $0.interestName }
    }
}
