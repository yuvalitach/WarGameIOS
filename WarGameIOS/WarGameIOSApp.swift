//
//  WarGameIOSApp.swift
//  WarGameIOS
//
//  Created by Student12 on 17/06/2023.
//

import SwiftUI

@main
struct WarGameIOSApp: App {
@StateObject var locationManager = LocationManager()
        var body: some Scene {
            WindowGroup {
                EnterNameView(viewModel: MainViewModel())
            }
        }
    }

