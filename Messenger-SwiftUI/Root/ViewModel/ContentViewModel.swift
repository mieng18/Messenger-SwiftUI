//
//  ContentViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import Firebase
import SwiftUI
import Combine


class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriber()
    }
    
    private func setupSubscriber(){
        AuthService.shared.$userSession.sink {[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
        
    }
    
}
