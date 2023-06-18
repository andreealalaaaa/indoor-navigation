//
//  Indoor_NavigationApp.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 02.05.2023.
//

import SwiftUI

@main
struct Indoor_NavigationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          LoginView()
//            CompassView(selectedLocation: 0)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            return true
        }
}
