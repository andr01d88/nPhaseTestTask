//
//  SurveyViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit
import ResearchKit

class SurveyViewController: UIViewController, ORKTaskViewControllerDelegate {
    private let viewModel: SurveyViewModel
    var coordinator: SurveyCoordinator?
    
    // MARK: - Init
    
    init(viewModel: SurveyViewModel = SurveyViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.onError = { [weak self] errorMessage in
            self?.coordinator?.showErrorAlert(errorMessage)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startSurvey()
    }

    // MARK: - Methods
    
    private func startSurvey() {
        let taskViewController = ORKTaskViewController(task: createSurveyTask(), taskRun: nil)
        taskViewController.delegate = self
        taskViewController.modalPresentationStyle = .fullScreen
        present(taskViewController, animated: true, completion: nil)
    }

    private func createSurveyTask() -> ORKTask {
        viewModel.getSurveyTask()
    }

    // MARK: - ORKTaskViewControllerDelegate
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        if reason == .completed {
            if let results = taskViewController.result.results {
                viewModel.processSurveyResults(results)
            }
        }
        taskViewController.dismiss(animated: true, completion: nil)
        coordinator?.navigationController.popViewController(animated: true)
    }
}
