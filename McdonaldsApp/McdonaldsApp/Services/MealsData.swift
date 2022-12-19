//
//  MealsData.swift
//  McdonaldsApp
//
//  Created by ульяна on 15.12.22.
//

import Foundation

class MealsData {
    
    static let shared = MealsData()
    
    var menu: NameOfSection
    
    private init() {
        menu = NameOfSection(burgers:
                                [Meal(image: #imageLiteral(resourceName: "Cheeseburger"), name: "Cheeseburger", price: 4),
                                 Meal(image: #imageLiteral(resourceName: "Chickenburger.png"), name: "Chickenburger", price: 3)],
                             frenchFries:
                                [Meal(image: #imageLiteral(resourceName: "French fries.png"), name: "French fries", price: 3),
                                 Meal(image: #imageLiteral(resourceName: "Deluxe Fries.png"), name: "Deluxe fries", price: 3)],
                             drinks:
                                [Meal(image: #imageLiteral(resourceName: "Cola.png"), name: "Cola", price: 2),
                                 Meal(image: #imageLiteral(resourceName: "Fanta.png"), name: "Fanta", price: 2)])
    }
}
