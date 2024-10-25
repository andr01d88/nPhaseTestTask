//
//  SurveyCoordinator.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let surveyViewController = SurveyViewController()
        surveyViewController.coordinator = self
        navigationController.pushViewController(surveyViewController, animated: true)
    }
}
