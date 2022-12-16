//
//  meal.swift
//  McdonaldsApp
//
//  Created by ульяна on 14.12.22.
//

import Foundation
import UIKit

struct NameOfSection {
    let burgers: [Meal]
    let frenchFries: [Meal]
    let drinks: [Meal]
}

struct Meal {
    
    let image: UIImage?
    let name: String
    let price: Int
    
    var feedback: [Feedback] = []

 var ratingBar: String {
    if let rating = rating {
        return String(repeating: "⭐️", count:Int(rating.rounded(.up)))
    } else {
        return "no reviews"
    }
}

private var rating: Double? {
    if feedback.isEmpty {
        return nil
    } else {
        var sum: Double = 0
        for review in feedback {
            sum += review.star
        }
        return sum / Double(feedback.count)
    }
}
}
