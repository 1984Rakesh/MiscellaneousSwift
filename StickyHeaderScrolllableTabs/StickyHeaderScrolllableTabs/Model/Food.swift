//
//  Food.swift
//  StickyHeaderScrolllableTabs
//
//  Created by Rakesh Patole on 08/08/21.
//

import Foundation

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var foods: [Food] = [
    Food(title: "Chocolate Cake",
         description: "Preparation starts after receiving the order. No storage. Chocolate-layered truffle cake that uses the finest chocolate and is absolutely heavenly.",
         price: "₹629",
         image: "3b9c8f1212800d2388e62c63969790a9"),
    Food(title: "Butterscotch Overload Cake",
         description: "Preparation starts after receiving the order. No storage. Bakery-fresh butterscotch delight that is going to turn your day around.",
         price: "₹499",
         image: "4e00875331ce5e40ff2faaa226047b1e"),
    Food(title: "Kiss of Love Romantic Anniversary Butterscotch Cake",
         description: "Preparation starts after receiving the order. No storage. That first kiss of love you had is the most romantic moment to cherish. Relive those memories with this kissing couple carved with fondant cake.",
         price: "₹599",
         image: "d54c5fba830ffadd804aa5f9297423ef"),
]
