//
//  SurveyHistoryCoordinator.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyHistoryCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let surveyHistoryViewController = SurveyHistoryViewController()
        surveyHistoryViewController.coordinator = self
        navigationController.pushViewController(surveyHistoryViewController, animated: true)
    }
    
    func showSurveyDetails(for user: User) {
        let surveyDetailsViewModel = SurveyDetailsViewModel(user: user)
        let surveyDetailsViewController = SurveyDetailsViewController(viewModel: surveyDetailsViewModel)
        navigationController.pushViewController(surveyDetailsViewController, animated: true)
    }
}
