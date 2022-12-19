//
//  Feedback.swift
//  McdonaldsApp
//
//  Created by ульяна on 14.12.22.
//

import Foundation


struct Feedback {
    
    private let date = Date()
    
    var text: String
    var star: Double
    
    
    var ratingBar: String{
        String(repeating: "⭐️", count:Int(star.rounded(.up)))
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
}
