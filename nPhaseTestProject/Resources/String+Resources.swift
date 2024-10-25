//
//  String+Resources.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation

struct Strings {

    struct Alerts {
        static let errorTitle = NSLocalizedString("Error", comment: "")
        static let okButton = NSLocalizedString("OK", comment: "")
    }
    
    struct SurveyHome {
        static let startSurveyTitle = NSLocalizedString("Start Survey", comment: "")
        static let showHistoryTitle = NSLocalizedString("Show Survey History", comment: "")
    }
    
    struct SurveyHistory {
        static let title = NSLocalizedString("Survey History", comment: "")
    }
    
    struct SurveyHistoryDetails {
        static let title = NSLocalizedString("Survey Details", comment: "")
        static let basicTitle = NSLocalizedString("Basic info", comment: "")
        static let interestsTitle = NSLocalizedString("Interests", comment: "")
        static let nameLabel = NSLocalizedString("Name", comment: "")
        static let ageLabel = NSLocalizedString("Age", comment: "")
        static let emailLabel = NSLocalizedString("Email", comment: "")
    }
    
    struct ServiceErrors {
        static let serializationError = NSLocalizedString("Failed to serialize user.", comment: "")
        static let storageSavingError = NSLocalizedString("Failed to store user.", comment: "")
        static let deserializationError = NSLocalizedString("Failed to deserialize user.", comment: "")
        static let storageFetchingError = NSLocalizedString("Failed to fetch user.", comment: "")
    }
    
    struct SurveyTask {
        static let yourNameTitle = NSLocalizedString("Your Name", comment: "")
        static let yourNameQuestion = NSLocalizedString("What is your name?", comment: "")
        static let yourNameInvalidMessage = NSLocalizedString("Please enter a valid name. Only alphabetic characters and spaces are allowed.", comment: "")
        static let yourAgeTitle = NSLocalizedString("Your Age", comment: "")
        static let ageUnit = NSLocalizedString("years", comment: "")
        static let yourAgeQuestion = NSLocalizedString("What is your age?", comment: "")
        static let yourEmailTitle = NSLocalizedString("Your Email", comment: "")
        static let yourEmailQuestion = NSLocalizedString("What is your email?", comment: "")
        static let invalidEmailMessage = NSLocalizedString("Invalid email address", comment: "")
        static let yourInterestsTitle = NSLocalizedString("Your Interests", comment: "")
        static let yourInterestsQuestion = NSLocalizedString("What are your interests?", comment: "")
        static let completionTitle = NSLocalizedString("Thank you!", comment: "")
        static let completionMessage = NSLocalizedString("Thanks for your answers. Resluts will be saved and can be viewed later.", comment: "")
        static let music = NSLocalizedString("Music", comment: "")
        static let sports = NSLocalizedString("Sports", comment: "")
        static let travel = NSLocalizedString("Travel", comment: "")
        static let reading = NSLocalizedString("Reading", comment: "")
    }
}
