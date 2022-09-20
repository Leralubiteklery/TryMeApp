//
//  TryMeAppApp.swift
//  TryMeApp
//
//  Created by Lera Savchenko on 19.09.22.
//

import SwiftUI

@main
struct TryMeAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currentValue: .constant(11), thumbColor: .constant(.red))
        }
    }
}
