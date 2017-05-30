//
//  SettingViewController.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

protocol DataEnterDelegate: class{
    func tipSetting(tipPercent:Float)
}

extension UIViewController
{
    func backToView(){
        if let nav = self.navigationController{
            nav.popViewController(animated: true)
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
class SettingViewController: UIViewController {

    var delegate: DataEnterDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tip5PercentSetting(_ sender: Any) {
        delegate?.tipSetting(tipPercent: 0.05)
        let defaults = UserDefaults.standard
        defaults.set(0.05, forKey: "Tip")
        defaults.synchronize()
        backToView()
    }
    @IBAction func tip10PercentSetting(_ sender: Any) {
        delegate?.tipSetting(tipPercent: 0.1)
        let defaults = UserDefaults.standard
        defaults.set(0.1, forKey: "Tip")
        defaults.synchronize()
        backToView()
    }
    
    @IBAction func tip15PercentSetting(_ sender: Any) {
        delegate?.tipSetting(tipPercent: 0.15)
        let defaults = UserDefaults.standard
        defaults.set(0.15, forKey: "Tip")
        defaults.synchronize()
        backToView()
    }
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
