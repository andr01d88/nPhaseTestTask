//
//  BaseViewModel.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation

class BaseViewModel {
    // Closure to notify about errors
    var onError: ((String) -> Void)?
    
    // Closure to notify when data has been updated
    var onDataUpdated: (() -> Void)?
    
    // Method to handle errors
    func handleError(_ error: Error) {
        onError?(error.localizedDescription)
    }
    
    // Method to notify data updates
    func notifyDataUpdated() {
        onDataUpdated?()
    }
}
