//
//  ContentView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI

struct MainView: View {
    init() {
        PushNotificationManager.shared.requestPushNotificationPermissions()
    }
    
    var body: some View {
        TabView {
            PantryView()
                .tabItem {
                    Image(systemName: "fork.knife.circle")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Pantry")
                }
            
            Text("Trends")
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Trends")
                }
            
            Text("Shopping")
                .tabItem {
                    Image(systemName: "pencil.and.list.clipboard")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Shopping")
                }
            
            Text("More")
                .tabItem {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("More")
                }
        }
    }
}

#Preview {
    MainView()
}
