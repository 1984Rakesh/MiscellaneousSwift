//
//  HomeViewModel.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import Foundation
import UIKit

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var selectedTab = tabs.first?.tab
}
