//
//  SurveyTaskProvider.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation
import ResearchKit

protocol SurveyTaskProviderable {
    func getSurveyTask() -> ORKOrderedTask
}

enum SurveyTaskSteps: String {
    case nameStep
    case ageStep
    case emailStep
    case interestsStep
    case completion
}

final class SurveyTaskProvider: SurveyTaskProviderable {
    func getSurveyTask() -> ORKOrderedTask {
        var steps = [ORKStep]()
        
        // Name input, Verification regexp added
        let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
        nameAnswerFormat.multipleLines = false
        nameAnswerFormat.validationRegularExpression = try? NSRegularExpression(pattern: "^[A-Za-z ]+$", options: .caseInsensitive)
        nameAnswerFormat.invalidMessage = Strings.SurveyTask.yourNameInvalidMessage
        
        let nameQuestionStep = ORKQuestionStep(identifier: SurveyTaskSteps.nameStep.rawValue, title: Strings.SurveyTask.yourNameTitle, question: Strings.SurveyTask.yourNameQuestion, answer: nameAnswerFormat)
        nameQuestionStep.isOptional = false
        steps.append(nameQuestionStep)
        
        // Age input, Positive number verification, Limit verification
        let ageAnswerFormat = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: Strings.SurveyTask.ageUnit)
        ageAnswerFormat.minimum = 0
        ageAnswerFormat.maximum = 120
        
        let ageQuestionStep = ORKQuestionStep(identifier: SurveyTaskSteps.ageStep.rawValue, title: Strings.SurveyTask.yourAgeTitle, question: Strings.SurveyTask.yourAgeQuestion, answer: ageAnswerFormat)
        ageQuestionStep.isOptional = false
        steps.append(ageQuestionStep)
        
        // Email input. Format validation regexp added.
        let emailAnswerFormat = ORKTextAnswerFormat(maximumLength: 50)
        emailAnswerFormat.multipleLines = false
        emailAnswerFormat.validationRegularExpression = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
        emailAnswerFormat.invalidMessage = Strings.SurveyTask.invalidEmailMessage
        let emailQuestionStep = ORKQuestionStep(identifier: SurveyTaskSteps.emailStep.rawValue, title: Strings.SurveyTask.yourEmailTitle, question: Strings.SurveyTask.yourEmailQuestion, answer: emailAnswerFormat)
        emailQuestionStep.isOptional = false
        steps.append(emailQuestionStep)
        
        // Interests input
        let interestTextChoices = [
            ORKTextChoice(text: Strings.SurveyTask.music, value: "Music" as NSString),
            ORKTextChoice(text: Strings.SurveyTask.sports, value: "Sports" as NSString),
            ORKTextChoice(text: Strings.SurveyTask.travel, value: "Travel" as NSString),
            ORKTextChoice(text: Strings.SurveyTask.reading, value: "Reading" as NSString)
        ]
        let interestAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: interestTextChoices)
        let interestQuestionStep = ORKQuestionStep(identifier: SurveyTaskSteps.interestsStep.rawValue, title: Strings.SurveyTask.yourInterestsTitle, question: Strings.SurveyTask.yourInterestsQuestion, answer: interestAnswerFormat)
        interestQuestionStep.isOptional = false
        steps.append(interestQuestionStep)
        
        //Completion step
        let completionStep = ORKCompletionStep(identifier: SurveyTaskSteps.completion.rawValue)
        completionStep.title = Strings.SurveyTask.completionTitle
        completionStep.text = Strings.SurveyTask.completionMessage
        steps.append(completionStep)
        
        return ORKOrderedTask(identifier: "surveyTask", steps: steps)
    }
}


