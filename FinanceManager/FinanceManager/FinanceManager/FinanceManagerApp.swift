//
//  FinanceManagerApp.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 16/9/24.
//

import SwiftUI
import Firebase

@main
struct FinanceManagerApp: App {
    
    init(){
        FirebaseApp.configure()
        print("Firebase configured")
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingScreen()
        }
    }
}

class Appdelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


