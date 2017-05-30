//
//  HistoryTipCalc.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

extension UIViewController{
    func performSegueToReturnBack(){
        if let nav = self.navigationController{
            nav.popViewController(animated: true)
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
class HistoryTipCalc: UITableViewController {
    // MARK: - Declared veriables
    var history:[History]?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        performSegueToReturnBack()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return history?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "History_Cell", for: indexPath) as! HistoryCell

        let history = self.history?[indexPath.row]
        
        cell.historyDate.text = history?.date
        cell.historyTip.text = history?.tip
        cell.historyTotal.text = history?.total

        return cell
    }
 

   

}
