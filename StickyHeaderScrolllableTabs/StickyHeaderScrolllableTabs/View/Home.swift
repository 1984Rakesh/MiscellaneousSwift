//
//  Home.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeObject: HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            GeometryReader { reader -> AnyView in
                let offset = reader.frame(in: .global).minY
                if -offset >= 0 {
                    DispatchQueue.main.async {
                        self.homeObject.offset = -offset
                    }
                    
                }
                return AnyView(
                    Image("7398da37ab73c4c7cb16ac860e577369")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( width: UIScreen.main.bounds.width,
                                height: 250 + (offset > 0 ? offset : 0 ))
                        .cornerRadius(2)
                        .offset(y: (offset > 0 ? -offset : 0))
                )
            }.frame(height:150)
            
            LazyVStack(alignment: .leading,
                       spacing: 15,
                       pinnedViews: [.sectionHeaders]) {
                Section(header: HeaderView()) {
                    
                    ForEach( tabs ) { tab in
                        VStack(alignment: .leading, spacing: 15) {
                            Text( tab.tab )
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .padding(.bottom)
                            
                            ForEach(tab.foods) { food in
                                CardView(food: food)
                            }
                            
                            Divider()
                                .padding(.top)
                        }
                        .tag(tab.tab)
                        .overlay (
                            GeometryReader { reader -> Text in
                                let offset = reader.frame(in: .global).minY
                                let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100
                                if offset < height &&
                                    offset > 50 &&
                                    homeObject.selectedTab != tab.tab {
                                    DispatchQueue.main.async {
                                        self.homeObject.selectedTab = tab.tab
                                    }
                                }
                                return Text("")
                            }
                        )
                    }
                }
            }
        }.overlay (
            Color.white
                .frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(self.homeObject.offset > 250 ? 1 : 0 ),
            alignment: .top
        ).environmentObject(homeObject)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
                .previewInterfaceOrientation(.landscapeLeft)
            Home()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
