//
//  FinalViewController.swift
//  PenaltyGame
//
//  Created by 반지윤 on 2020/12/01.
// 00

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var finalLoser: UILabel!
    
   // var finalLoserName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalLoser.text = DataManager.shared.name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
