//
//  SurveyHomeViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyHomeViewController: UIViewController {

    var coordinator: MainCoordinator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRootView()
    }
    
    private func addRootView() {
        let surveyHomeView = SurveyHomeView()
        view.addSubview(surveyHomeView)
        surveyHomeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            surveyHomeView.topAnchor.constraint(equalTo: view.topAnchor),
            surveyHomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            surveyHomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            surveyHomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        surveyHomeView.startSurveyButton.addTarget(self, action: #selector(startSurveyTapped), for: .touchUpInside)
        surveyHomeView.showHistoryButton.addTarget(self, action: #selector(showHistoryTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func startSurveyTapped() {
        coordinator?.startSurvey()
    }

    @objc private func showHistoryTapped() {
        coordinator?.showSurveyHistory()
    }

}

