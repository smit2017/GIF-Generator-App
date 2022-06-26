//
//  GIFMakerApp.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import SwiftUI
import Firebase

@main
struct GIFMakerApp: App {
    //Mark : Intialize Firebase
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
