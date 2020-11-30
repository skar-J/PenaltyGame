//
//  CountViewController.swift
//  PenaltyGame
//
//  Created by 반지윤 on 2020/11/26.
//

import UIKit

class CountDownViewController: UIViewController {

    @IBOutlet weak var checkButton: UIButton!
    
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    var counter:Int = 5
//    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        checkButton.isHidden = true
        
    }

    
    
    @objc func updateCounter() {
        if(counter > 0) {
            countDownLabel.text = String(counter)
            //print("\(counter)")
            counter -= 1
        }
    }
}
