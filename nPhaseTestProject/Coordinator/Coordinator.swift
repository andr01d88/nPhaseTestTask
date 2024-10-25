//
//  Coordinator.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func showErrorAlert(_ message: String)
    func start()
}

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var surveyCoordinator: SurveyCoordinator?
    var surveyHistoryCoordinator: SurveyHistoryCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = SurveyHomeViewController()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func startSurvey() {
        surveyCoordinator = SurveyCoordinator(navigationController: navigationController)
        surveyCoordinator?.start()
    }
    
    func showSurveyHistory() {
        surveyHistoryCoordinator = SurveyHistoryCoordinator(navigationController: navigationController)
        surveyHistoryCoordinator?.start()
    }
}

extension Coordinator {
    func showErrorAlert(_ message: String) {
        // Implement the logic to present an alert or error message with a slight delay to make sure the view hierarchy does not have dismissed view controllers
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let alertController = UIAlertController(title: Strings.Alerts.errorTitle, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: Strings.Alerts.okButton, style: .default, handler: nil))
            
            // Present the alert on the topmost view controller
            if let topViewController = getTopViewController() {
                topViewController.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        }
        
        if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        
        return base
    }
}

