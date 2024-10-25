//
//  SurveyDetailsViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyDetailsViewController: UIViewController {
    private let viewModel: SurveyDetailsViewModel
    
    // MARK: - Init
    init(viewModel: SurveyDetailsViewModel) {
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
