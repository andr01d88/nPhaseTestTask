//
//  SurveyViewModel.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation
import ResearchKit

final class SurveyViewModel: BaseViewModel {
    private let surveyTaskProvider: SurveyTaskProviderable
    private let serializationService: UserSerializationService
    private let realmService: RealmStorageService
    
    init(surveyTaskProvider: SurveyTaskProviderable = SurveyTaskProvider(),
         serializationService: UserSerializationService = UserSerializationService(),
         realmService: RealmStorageService = RealmStorageService()) {
        self.surveyTaskProvider = surveyTaskProvider
        self.serializationService = serializationService
        self.realmService = realmService
    }
    
    func processSurveyResults(_ results: [ORKResult]) {
        var name: String?
        var age: Int?
        var email: String?
        var interests = [String]()
        
        for result in results {
            if let stepResult = result as? ORKStepResult {
                if let firstResult = stepResult.results?.first {
                    if firstResult.identifier == SurveyTaskSteps.nameStep.rawValue, let nameResult = firstResult as? ORKTextQuestionResult {
                        name = nameResult.textAnswer
                    }
                    if firstResult.identifier == SurveyTaskSteps.ageStep.rawValue,
                       let ageResult = firstResult as? ORKNumericQuestionResult,
                       let ageAnswer = ageResult.numericAnswer {
                        age = ageAnswer.intValue
                    }
                    if firstResult.identifier == SurveyTaskSteps.emailStep.rawValue,
                       let emailResult = firstResult as? ORKTextQuestionResult {
                        email = emailResult.textAnswer
                    }
                    if firstResult.identifier == SurveyTaskSteps.interestsStep.rawValue,
                       let interestResult = firstResult as? ORKChoiceQuestionResult,
                       let chosenInterests = interestResult.choiceAnswers as? [String] {
                        interests.append(contentsOf: chosenInterests)
                    }
                }
            }
        }
        
        if let name = name, let age = age, let email = email {
            let user = User()
            user?.name = name
            user?.age = age
            user?.email = email
            user?.interests = interests.map { Interest(interestName: $0) }
            
            serializationService.serializeUser(user) { [weak self] jsonString, error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if let error = error {
                        self.onError?(Strings.ServiceErrors.serializationError + error.localizedDescription)
                        return
                    }
                }
              
                if let jsonString = jsonString {
                    self.realmService.saveUserJSON(jsonString) { error in
                        if let error = error {
                            //Realm Completion is run on main thread as per Service implementation
                            self.onError?(Strings.ServiceErrors.storageSavingError + error.localizedDescription)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.onError?(Strings.ServiceErrors.serializationError)
                    }
                }
            }
        }
    }
    
    func getSurveyTask() -> ORKOrderedTask {
        return surveyTaskProvider.getSurveyTask()
    }
}

