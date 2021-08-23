//
//  CreatingTabsWithTabViewAndTabItem.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI

struct CreatingTabsWithTabViewAndTabItem: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab  = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("One")
                }
                .tag(0)
            Text("Tab 2")
                .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Two")
                }
                .tag(1)
        }
    }
}

struct CreatingTabsWithTabViewAndTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CreatingTabsWithTabViewAndTabItem()
    }
}
