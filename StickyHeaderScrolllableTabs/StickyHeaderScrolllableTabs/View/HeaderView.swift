//
//  HeaderView.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeObject: HomeViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing:0) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width:getSize(), height:getSize())
                        .foregroundColor(.primary)
                })
                
                Text("Rakesh Bakery!!")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Indian . Asian . Thai")
                        .font(.caption)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30-40 min")
                            .font(.caption)
                        
                        Text("4")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        Text("6.3 fee")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                }.opacity(homeObject.offset > 200 ? 1 - Double((homeObject.offset - 200)/50) : 1 )
                
                ScrollViewReader { reader in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:0) {
                            ForEach(tabs) { tab in
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Color.primary.opacity(homeObject.selectedTab == tab.tab ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeObject.selectedTab == tab.tab ? .white : .black)
                                    .id(tab.tab)
                            }
                        }
                        .onChange(of: homeObject.selectedTab) { value in
                            withAnimation(.easeInOut) {
                                reader.scrollTo(value, anchor: .leading)
                            }
                        }
                    }.opacity(homeObject.offset > 200 ? Double((homeObject.offset - 200) / 50) : 0)
                }
                
            }
            .frame(height:60)
            
            if homeObject.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height:100)
        .background(Color.white)
    }
    
    func getSize() -> CGFloat {
        if homeObject.offset > 200 {
            let progress = (homeObject.offset - 200) / 50
            if progress <= 1.0 {
                return progress * 40
            }
            else {
                return 40
            }
        }
        else {
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
