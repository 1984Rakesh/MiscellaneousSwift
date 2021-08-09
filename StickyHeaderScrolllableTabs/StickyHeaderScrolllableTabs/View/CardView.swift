//
//  CardView.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import SwiftUI

struct CardView: View {
    var food: Food
    var body: some View {
        HStack (alignment: .top) {
            VStack(alignment:.leading, spacing: 10) {
                Text(food.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)
                
                Text(food.price)
                    .fontWeight(.bold)
            }
            
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .frame(width: 75, height: 75)
                .cornerRadius(3)
            
        }.padding( .horizontal)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
