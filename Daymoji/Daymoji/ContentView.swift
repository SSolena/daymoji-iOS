//
//  ContentView.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
struct TabsView: View {
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            CalendarView()
                .tabItem {
                    Image("Tabs1")
                    Text("감정 달력")
                }
            TodayView()
                .tabItem {
                    Image("Tabs2")
                    Text("감정 기록")
                }
            EmojiMapView()
                .tabItem {
                    Image("Tabs3")
                    Text("감정 지도")
                }
        }
    }
}
