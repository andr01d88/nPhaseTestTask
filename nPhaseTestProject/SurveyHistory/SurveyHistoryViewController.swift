//
//  SurveyHistoryViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

class SurveyHistoryViewController: UIViewController {
    private let viewModel: SurveyHistoryViewModel
    var coordinator: SurveyHistoryCoordinator?
    
    // MARK: - Init
    init(viewModel: SurveyHistoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
