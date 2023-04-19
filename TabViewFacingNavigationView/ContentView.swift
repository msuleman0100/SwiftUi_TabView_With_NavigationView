//
//  ContentView.swift
//  TabViewFacingNavigationView
//
//  Created by Muhammad Suleman on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    
    // Creating Object of tabbarVisibilityManager
    @StateObject var tabbarVisibilityManager = TabbarVisibilityManager()
    
    var body: some View {
        TabView {
            Tab1View()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            
                Tab2View()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Second")
                    }
        }
        // Sharing tabbarVisibilityManager across the App
        .environmentObject(tabbarVisibilityManager)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/// Creating  ObservableObject for making tabBarVisibility variable @Published
/// So we can share it across all the view...
class TabbarVisibilityManager: ObservableObject {
    @Published var tabBarVisibility: Visibility = .visible
    
}
