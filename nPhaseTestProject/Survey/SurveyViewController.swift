//
//  SurveyViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

class SurveyViewController: UIViewController {
    private let viewModel: SurveyViewModel
    var coordinator: SurveyCoordinator?
    
    // MARK: - Init
    init(viewModel: SurveyViewModel) {
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
