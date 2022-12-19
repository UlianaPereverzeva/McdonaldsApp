//
//  CreateFeedbackViewController.swift
//  McdonaldsApp
//
//  Created by ульяна on 15.12.22.
//

import UIKit

protocol CreateFeedbackDelegate: AnyObject {
    func didAddFeedback(_ feedback: Feedback, toMealAtIndex: IndexPath)
}

class CreateFeedbackViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var feedbackTextView: UITextView!
    @IBOutlet weak var mark: UISegmentedControl!
    @IBOutlet weak var saveReviewButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    weak var delegate: CreateFeedbackDelegate?
    var indexInTable: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedbackTextView.delegate = self
        
    }
    

    @IBAction func saveRview(_ sender: UIButton) {
        let feedback = Feedback(text: feedbackTextView.text, star: Double(mark.selectedSegmentIndex + 1))
        if let index = indexInTable {
            self.delegate?.didAddFeedback(feedback, toMealAtIndex: index)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedbackTextView {
            let isLettersEnough = textView.text.count >= 10
            saveReviewButton.isEnabled = isLettersEnough
            errorLabel.isHidden = isLettersEnough
            errorLabel.text = "You need to write more than 10 symbols"
        }
        return true
    }

}
