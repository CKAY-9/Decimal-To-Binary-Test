//
//  DecimalToBinaryTestApp.swift
//  DecimalToBinaryTest
//
//

import SwiftUI

@main
struct DecimalToBinaryTestApp: App {
    init() {
        if UserDefaults.standard.integer(forKey: "personalBest") <= 0 {
            UserDefaults.standard.set(0, forKey: "personalBest");
        }
    }
    
    var body: some Scene {
        WindowGroup {
            DTBApp()
        }
    }
}
