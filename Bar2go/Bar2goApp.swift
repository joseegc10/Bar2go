//
//  Bar2goApp.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

@main
struct Bar2goApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let login = BarViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
