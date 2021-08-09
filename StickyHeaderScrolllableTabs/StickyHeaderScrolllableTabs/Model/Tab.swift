//
//  Tab.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import Foundation

struct Tab: Identifiable {
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabs: [Tab] = [
    Tab(tab: "Order Again", foods: foods.shuffled()),
    Tab(tab: "Popular", foods: foods.shuffled()),
    Tab(tab: "Recently Added", foods: foods.shuffled())
]
