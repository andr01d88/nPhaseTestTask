//
//  SurveyDetailsViewController.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel: SurveyDetailsViewModel
    private var surveyDetailsView = SurveyDetailsView()
    
    // MARK: - Init
    
    init(viewModel: SurveyDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = surveyDetailsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Strings.SurveyHistoryDetails.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        surveyDetailsView.tableView.dataSource = self
        surveyDetailsView.tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.getBasicInfo().count
        case 1:
            return viewModel.getInterests().count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Strings.SurveyHistoryDetails.basicTitle
        case 1:
            return Strings.SurveyHistoryDetails.interestsTitle
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        switch indexPath.section {
        case 0:
            let basicInfo = viewModel.getBasicInfo()[indexPath.row]
            cell.textLabel?.text = "\(basicInfo.0): \(basicInfo.1)"
        case 1:
            cell.textLabel?.text = viewModel.getInterests()[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
