//
//  CellManager.swift
//  McdonaldsApp
//
//  Created by ульяна on 16.12.22.
//

import Foundation
import UIKit

final class CellManager {
    static func configure(_ cell: UITableViewCell, with meal: Meal){
        cell.textLabel?.text = meal.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        cell.detailTextLabel?.text = "\(meal.price)$\n \(meal.ratingBar)"
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cell.imageView?.image = meal.image
        
    }
}
