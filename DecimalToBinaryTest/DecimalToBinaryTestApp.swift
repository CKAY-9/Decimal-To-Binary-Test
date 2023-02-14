//
//  DecimalToBinaryTestApp.swift
//  DecimalToBinaryTest
//
//  Created by Cameron Armstrong on 2023-02-13.
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
