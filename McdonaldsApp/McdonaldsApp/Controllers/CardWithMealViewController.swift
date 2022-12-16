//
//  CardWithMealViewController.swift
//  McdonaldsApp
//
//  Created by ульяна on 14.12.22.
//

import UIKit

class CardWithMealViewController: UIViewController {
    
    @IBOutlet weak var imageOfMeal: UIImageView!
    @IBOutlet weak var nameOfMeal: UILabel!
    @IBOutlet weak var priceOfMeal: UILabel!
    @IBOutlet weak var marks: UILabel!
    @IBOutlet weak var lookFeedbacks: UIButton!
    @IBOutlet weak var leaveFeedbackButton: UIButton!
    var currentMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMarks()
        setUpColorOfAddFeedback()
        SetUpImage()
        setUpNameAndPrice ()
        doEnableButton()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func leaveFeedback(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CreateFeedbackViewController") as? CreateFeedbackViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func lookFeedbacksButton(_ sender: UIButton) {
        
        
    }
    func SetUpImage() {
        imageOfMeal.image = currentMeal?.image
    }
    func setUpNameAndPrice () {
        nameOfMeal.text = currentMeal?.name
        priceOfMeal.text = String("\(currentMeal?.price ?? 0) $")
    }
    func doEnableButton() {
        
        if let menu = currentMeal?.feedback.isEmpty {
            
            lookFeedbacks.isEnabled == false
            lookFeedbacks.setTitle("Steal no reviews", for: .normal)
            lookFeedbacks.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            
        } else {
            lookFeedbacks.isEnabled == true
            lookFeedbacks.setTitle("Look \(currentMeal?.feedback.count) reviews", for: .normal)
            lookFeedbacks.tintColor = UIColor(red: 1.00, green: 0.79, blue: 0.38, alpha: 1.00).withAlphaComponent(1)
        }
    }
    func setUpColorOfAddFeedback() {
        leaveFeedbackButton.backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.38, alpha: 1.00).withAlphaComponent(1)
        leaveFeedbackButton.layer.cornerRadius = 60
    }
    func setUpMarks() {
        marks.text = currentMeal?.ratingBar
        
    }
}

