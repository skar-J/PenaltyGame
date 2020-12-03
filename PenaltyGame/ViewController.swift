//
//  ViewController.swift
//  penaltyGameProject
//
//  Created by 반지윤 on 2020/11/20.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var peopleCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stepper.wraps = false // true이면 최대값이 될때 다시 최소값으로 바꾼다
        //stepper.autorepeat = true // 누르고 있으면 반복해서 눌러진다라는 옵션? 이라는데 있으나 없으나 실행됌.. 뭐여.
        stepper.maximumValue = 10 // 최대값 설정
        stepper.minimumValue = 2 // 최소값 설정
    }
    
    // 값과 버튼을 연결하는 메소드
    @IBAction func stepperValueChanged(sender: UIStepper) {
        
        peopleCount.text = Int(sender.value).description
        //delegate!.sendData(data: peopleCount.text)
        //delegate?.sendData(data: Int(peopleCount.text!) ?? 0)
    }
}

extension ViewController : Getdelegate {
    
    func get() -> Int {
        return Int(peopleCount.text ?? "지윤" ) ?? 0
        //return Int(peopleCount.text!) ?? 0
    }
}

