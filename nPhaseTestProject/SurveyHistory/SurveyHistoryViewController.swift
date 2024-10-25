//
//  SurveyHistoryViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

class SurveyHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel: SurveyHistoryViewModel
    private let surveyHistoryView = SurveyHistoryView()
    var coordinator: SurveyHistoryCoordinator?
    
    // MARK: - Init
    
    init(viewModel: SurveyHistoryViewModel = SurveyHistoryViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = surveyHistoryView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Strings.SurveyHistory.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        surveyHistoryView.tableView.dataSource = self
        surveyHistoryView.tableView.delegate = self
        
        viewModel.onDataUpdated = { [weak self] in
            self?.surveyHistoryView.tableView.reloadData()
        }
        
        viewModel.onError = { [weak self] errorMessage in
            self?.coordinator?.showErrorAlert(errorMessage)
        }
        
        viewModel.fetchSurveyHistory()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSurveys()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        let user = viewModel.survey(at: indexPath.row)
        cell.textLabel?.text = user?.name ?? ""
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = viewModel.survey(at: indexPath.row) else { return }
        coordinator?.showSurveyDetails(for: user)
    }
}
