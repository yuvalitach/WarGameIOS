//
//  MainViewModel.swift
//  WarGameIOS
//
//  Created by Student12 on 17/06/2023.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isButtonVisible = true
    @Published var isStartButtonVisible = false
    @Published var userLocation: CLLocation?
    
    private let locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()

    init() {
        locationManager.$userLocation
            .sink { [weak self] location in
                self?.handleLocationUpdate(location)
            }
            .store(in: &cancellables)
    }
    
    private func handleLocationUpdate(_ location: CLLocation?) {
        guard let userLocation = location else { return }
        
        let isUserEastOfLocation = userLocation.coordinate.longitude > 34.817
        isButtonVisible = isUserEastOfLocation
        isStartButtonVisible = !isUserEastOfLocation
        self.userLocation = userLocation
    }
    
    func setName() {
        if !name.isEmpty {
            isButtonVisible = false
            isStartButtonVisible = true
        }
    }
}
