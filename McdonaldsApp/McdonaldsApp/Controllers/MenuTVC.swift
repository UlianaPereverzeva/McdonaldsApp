//
//  MenuTVC.swift
//  McdonaldsApp
//
//  Created by ульяна on 14.12.22.
//

import UIKit

class MenuTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationController?.navigationBar.tintColor = UIColor(red: 1.00, green: 0.79, blue: 0.38, alpha: 1.00).withAlphaComponent(1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let meal: Meal
        switch indexPath.section {
        case 0:
            meal = MealsData.shared.menu.burgers[indexPath.row]
        case 1:
            meal = MealsData.shared.menu.frenchFries[indexPath.row]
        case 2:
            meal = MealsData.shared.menu.drinks[indexPath.row]
        default:
            return UITableViewCell()
        }
    
        CellManager.configure(cell, with: meal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Burgers"
        } else if section == 1 {
            return "FrenchFries"
        } else if section == 2 {
            return "Drinks"
        } else {
            return nil
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            MealsData.shared.meals.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)}
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.38, alpha: 1.00).withAlphaComponent(1)
        
        let myLabel = UILabel()
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        myLabel.textColor = UIColor.white
        myLabel.textAlignment = .center
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let currentMeal = MealsData.shared.meals.remove(at: fromIndexPath.row)
//        MealsData.shared.meals.insert(currentMeal, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CardWithMealViewController") as? CardWithMealViewController else { return }
        
        switch indexPath.section {
        case 0:
            vc.currentMeal = MealsData.shared.menu.burgers[indexPath.row]
        case 1:
            vc.currentMeal = MealsData.shared.menu.frenchFries[indexPath.row]
        case 2:
            vc.currentMeal = MealsData.shared.menu.drinks[indexPath.row]
        default:
            break
        }
        vc.feedbackDelegate = self
        vc.indexInTable = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension MenuTVC: CreateFeedbackDelegate {
    func didAddFeedback(_ feedback: Feedback, toMealAtIndex: IndexPath) {
        switch toMealAtIndex.section {
        case 0:
            MealsData.shared.menu.burgers[toMealAtIndex.row].feedback.append(feedback)
        case 1:
            MealsData.shared.menu.frenchFries[toMealAtIndex.row].feedback.append(feedback)
        case 2:
            MealsData.shared.menu.drinks[toMealAtIndex.row].feedback.append(feedback)
        default:
            break
        }
        tableView.reloadData()
    }
}
