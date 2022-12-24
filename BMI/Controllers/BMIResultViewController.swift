//
//  BMIResultViewController.swift
//  BMI
//
//  Created by 김병준 on 2022/12/16.
//

import UIKit

class BMIResultViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        makeUI()
        
    }
    
    
    func makeUI() {
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = String(bmi.value)
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
