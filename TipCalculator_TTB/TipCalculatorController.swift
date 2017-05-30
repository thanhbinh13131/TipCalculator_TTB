//
//  TipCalculatorController.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class TipCalculatorController: UIViewController, UITextFieldDelegate, DataEnterDelegate {
    
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var amountBeforeTax: UITextField!
    
    @IBOutlet weak var tipPercentage: UISlider!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    var history = [History]()
    
    var calculator = TipCalculator(amountBeforeTax: 25.00, tipPercentage: 0.05 )
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tip = defaults.float(forKey: "Tip")
        calculator.tipPercentage = tip
        if let data = UserDefaults.standard.data(forKey: "HistoryCalc"),
            let decoded = NSKeyedUnarchiver.unarchiveObject(with: data) as? [History]{
            history = decoded
        }
    
        amountBeforeTax.text = String(format: "%0.2f", arguments: [calculator.amountBeforeTax])
        tipPercentLabel.text = String(format: "%d%%", arguments: [Int(calculator.tipPercentage * 100)])
    }

    func calculateTip(){
        calculator.amountBeforeTax = ((amountBeforeTax.text)! as NSString).floatValue
        //calculator.tipPercentage = ((tipPercentLabel.text)! as NSString).floatValue
        calculator.calculateTip()
        updateUI()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy"
        let today = formatter.string(from: date)
        
        history.append(History(tip: "Tip: \(calculator.amountBeforeTax) * \(calculator.tipPercentage) = \(calculator.tipAmount)",
                                total: "Total: \(calculator.tipAmount) + \(calculator.amountBeforeTax) = \(calculator.totalAmount)",
                            date: String(today)))
        
        let defaults = UserDefaults.standard
        let encodeData: Data = NSKeyedArchiver.archivedData(withRootObject: history)
        defaults.set(encodeData, forKey: "HistoryCalc")
        defaults.synchronize()
        
    }
    func updateUI(){
        totalAmount.text = String(format:"Total: $%0.2f Tip: $%0.2f ", arguments: [calculator.totalAmount, calculator.tipAmount])
    }
    
    @IBAction func amountBeforeTextFieldChanged(_ sender: Any) {
        calculateTip()
    }
    @IBAction func tipPercentageSliderChanged(_ sender: Any) {
//        tipPercentageLabel.text = String(format: "Tip: %02d%%", arguments: [Int(tipPercentage.value * 100)])
//        calculateTip()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == amountBeforeTax{
            textField.resignFirstResponder()
            calculateTip()
        }
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "setting" {
            let settingVC = segue.destination as! SettingViewController
            settingVC.delegate = self
        }
        if segue.identifier == "history" {
            let historyVC = segue.destination as! HistoryTipCalc
            historyVC.history = self.history
        }
    }
    func tipSetting(tipPercent: Float){
        calculator.tipPercentage = tipPercent
        amountBeforeTax.text = String(format: "%0.2f", arguments: [calculator.amountBeforeTax])
        tipPercentLabel.text = String(format: "%d%%", arguments: [Int(calculator.tipPercentage * 100)])
        calculateTip()
    }
    

    
    
    
    
    
    
    
    
}
