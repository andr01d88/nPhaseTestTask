//
//  SurveyHomeView.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import UIKit

final class SurveyHomeView: UIView {
    
    // MARK: - UI Elements
    
    let startSurveyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.SurveyHome.startSurveyTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let showHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.SurveyHome.showHistoryTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(startSurveyButton)
        addSubview(showHistoryButton)
        
        NSLayoutConstraint.activate([
            startSurveyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startSurveyButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            
            showHistoryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showHistoryButton.topAnchor.constraint(equalTo: startSurveyButton.bottomAnchor, constant: 20)
        ])
    }
}
