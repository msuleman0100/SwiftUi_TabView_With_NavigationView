//
//  Tab2View.swift
//  TabViewFacingNavigationView
//
//  Created by Muhammad Suleman on 4/19/23.
//

import SwiftUI

struct Tab2View: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Tab 2")
                    .font(.title)
                Text("The below button will navigate you to detailed screen but also it won't hide the tab bar.")
                    .font(.title3)
                    .padding()
                NavigationLink(destination: Tab2DetailedView()) {
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

struct Tab2DetailedView: View {
   
    // For navigating back to home view on button click...
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            Text("Tab.2 Detailed View")
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
        
    }
}

struct Tab2_Previews: PreviewProvider {
    static var previews: some View {
        Tab2View()
    }
}
