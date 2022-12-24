//
//  ViewController.swift
//  BMI
//
//  Created by 김병준 on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calcalateButton: UIButton!
    
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeUI()
    }
    
    func makeUI() {
        // 유저한테 입력을 받아서 main ViewController에 전달
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요!!"
        calcalateButton.layer.cornerRadius = 5
        calcalateButton.clipsToBounds = true
        calcalateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }


    // BMI계산하기 - 버튼 누르면(다음화면)
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    // 무조건 다음페이지로 넘어 갈때에는 꼭!! 구현할 필요가 없음
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toBMIVC" {
           let BMIVC = segue.destination as! BMIResultViewController
            
            // 계산된 결과값을 다음화면으로 전달
            BMIVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 두개의 텍스트필드를 모두 종료(키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        
        // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}

