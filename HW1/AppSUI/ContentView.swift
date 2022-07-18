//
//  ContentView.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 05.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            DashboardScreen()
                .font(.title)
                .tabItem {
                    HStack {
                        Label("Dashboard", systemImage: "pawprint.fill")
                    }
                }
                .tag(0)
            
            ListExample()
                .font(.title)
                .tabItem {
                    HStack {
                        Label("List", systemImage: "list.bullet.rectangle.fill")
                    }
                }
                .tag(1)
            
            ProfileScreen()
                
                .tabItem {
                    VStack {
                        Text("Profile")
                        Image(systemName: "person.fill")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
