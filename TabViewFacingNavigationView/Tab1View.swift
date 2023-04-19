//
//  Tab1View.swift
//  TabViewFacingNavigationView
//
//  Created by Muhammad Suleman on 4/19/23.
//

import SwiftUI

struct Tab1View: View {
    
    // Fetching current state of tabbarVisibilityManager from Environment
    @EnvironmentObject var tabbarVisibilityManager: TabbarVisibilityManager
    
    var body: some View {
        NavigationView {
            VStack  {
                Text("Tab 1")
                    .font(.title)
                Text("The below button will navigate you to detailed screen but also it will hide the tab bar. It will be visible when coming  back  to this screen")
                    .font(.title3)
                    .padding()
                NavigationLink(destination: Tab1DetailedView()) {
                    Text("Go Deeper")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct Tab1DetailedView: View {
    
    // For navigating back to home view on button click...
    @Environment(\.presentationMode) var mode
    // Fetching current state of tabbarVisibilityManager from Environment
    @EnvironmentObject var tabbarVisibilityManager: TabbarVisibilityManager
    
    var body: some View {
        VStack {
            Text("Tab.1 Detailed View")
                .font(.title)
            Text("Go Back")
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    // Going Back to home view  on button click....
                    mode.wrappedValue.dismiss()
                }
        }
        // We need this modifier for managiing tabbar on the detailed screen
        .toolbar(tabbarVisibilityManager.tabBarVisibility, for: .tabBar)
        .onAppear() {
            withAnimation {
                // Hiding tabbar on onAppear(when this view appears)
                tabbarVisibilityManager.tabBarVisibility = .hidden
            }
        }
        .onDisappear() {
            withAnimation {
                // Showing tabbar again on onDisappear(when this view disappears)
                tabbarVisibilityManager.tabBarVisibility = .visible
            }
        }
    }
}

struct Tab1_Previews: PreviewProvider {
    static var previews: some View {
        Tab1View()
    }
}
