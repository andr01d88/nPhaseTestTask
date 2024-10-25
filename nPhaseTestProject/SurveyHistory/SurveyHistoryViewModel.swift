//
//  SurveyHistoryViewModel.swift
//  nPhaseTestProject
//
//  Created by Andrew Koryagin on 25.10.24.
//

import Foundation

final class SurveyHistoryViewModel: BaseViewModel {
    private let realmService: RealmStorageService
    private let serializationService: UserSerializationService
    
    private var users: [User] = []
    
    init(realmService: RealmStorageService = RealmStorageService(),
         serializationService: UserSerializationService = UserSerializationService()) {
        self.realmService = realmService
        self.serializationService = serializationService
    }
    
    // Fetch saved surveys (JSONs) from Realm, deserialize them into User models
    func fetchSurveyHistory() {
        users.removeAll()
        
        // Fetch JSON strings from Realm
        realmService.fetchAllUserJSONs { [weak self] surveyJSONs, error in
            guard let self = self else { return }
            
            if let error = error {
                self.onError?(Strings.ServiceErrors.storageFetchingError + error.localizedDescription)
                return
            }
            
            guard let surveyJSONs = surveyJSONs else {
                self.onError?(Strings.ServiceErrors.storageFetchingError)
                return
            }
            
            let dispatchGroup = DispatchGroup()
            
            // Deserialise JSON strings
            for json in surveyJSONs {
                dispatchGroup.enter()
                self.serializationService.deserializeUser(fromJSON: json) { user, error in
                    if let error = error {
                        self.onError?(Strings.ServiceErrors.deserializationError + error.localizedDescription)
                    } else if let user = user {
                        self.users.append(user)
                    }
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                self.onDataUpdated?()
            }
        }
    }
    
    func numberOfSurveys() -> Int {
        return users.count
    }
    
    func survey(at index: Int) -> User? {
        guard index >= 0 && index < users.count else { return nil }
        return users[index]
    }
}

