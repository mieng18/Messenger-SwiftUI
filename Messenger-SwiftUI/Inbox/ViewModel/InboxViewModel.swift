//
//  InboxViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import Foundation
import Combine

@MainActor
class InboxViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        setupSubcribers()
    }
    
    private func setupSubcribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
    }
    
}
