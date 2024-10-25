//
//  SurveyHomeViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyHomeViewController: UIViewController {

    var coordinator: MainCoordinator?

    private let homeView = SurveyHomeView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        homeView.startSurveyButton.addTarget(self, action: #selector(startSurveyTapped), for: .touchUpInside)
        homeView.showHistoryButton.addTarget(self, action: #selector(showHistoryTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func startSurveyTapped() {
        coordinator?.startSurvey()
    }

    @objc private func showHistoryTapped() {
        coordinator?.showSurveyHistory()
    }

}

