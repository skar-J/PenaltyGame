//
//  ViewController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var peopleCount: UIStepper!
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        resultValue.text = Int(sender.value).description
    }
    
    @IBAction func Click_resetBtn(_ sender: Any) {
        if peopleCount.value != 0 {
            peopleCount.value = 0
            resultValue.text = Int(0).description
        }
    }
    
    @IBAction func Click_nextBtn(_ sender: Any) {
        // 이동하려는 View가 있는지 확인한다.
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") {
            
            // 찾게 된다면 이동할 View로 Push 한다.
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleCount.wraps = false
        peopleCount.autorepeat = true
        peopleCount.maximumValue = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 네비게이션바 숨김
        self.navigationController?.isNavigationBarHidden = true
    }
}
