//
//  Core__FinalApp.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI
//main App swift file
@main
struct Core__FinalApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                //When the app is launched the HomePageView is the primary view
                HomePageView()
            }
            //declaring environmentObject of listViewModel of type ListViewModel allows this object to be accesible
            //for all subsequent views
            .environmentObject(listViewModel)
        }
    }
}
