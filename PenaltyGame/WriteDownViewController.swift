//
//  PenaltyGameParticipantsViewController.swift
//  PenaltyGame
//
//  Created by 반지윤 on 2020/11/23.
//

import UIKit

protocol Getdelegate {
    func get() -> Int
}

class WriteDownViewController: UIViewController {
    
    var delegate: Getdelegate!
    var num = 1
    
//var randomNumber: Int = Int(arc4random_uniform(10) + 1)//2~10
    
    var text:String = ""
    
    //    func sendData(data: Int) {
    //        p = data
    //    }
    //00

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func mixButton(_ sender: Any) {
        
        //테이블뷰에서 셀의 갯수를 가져올 수 있다. -> 만약에 5개면 5개를 가지고 랜덤수를 생성하고  -> 랜덤으로 만든 인덱스를 가지고 셀을 다시 뽑아야한다 -> 그 셀에서 텍스트를 가져와서 프린트를 하든지 다음에 넘겨주던지
        
        //난수
       
        var randomNumber: Int = Int(arc4random_uniform(UInt32(tableView.numberOfRows(inSection: 0))))
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: randomNumber, section: 0)) as? ParticipantsListCell else { return }
       
        //tableView.numberOfRows(inSection: 0) == 5
           //셀이 한개 생성되면 난수가 1개 생성되고
           //셀이 4개 생성되면 난수가 4개 생성되고
        
        print(cell.writeDownField.text)
        
        guard let FinalVC = self.storyboard?.instantiateViewController(identifier: "FinalViewController") as? FinalViewController else {return}
        
        FinalVC.finalLoser = cell.writeDownField.text
//        if cell.writeDownField.count >= 2 {
//            randomNumber <= cell.writeDownField.count
//        }

//        if String(cell.writeDownField.text!).count >= 2 {
//            randomNumber <= 2
//        }

//         text = cell.writeDownField.text!
//         print(text)
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ParticipantsListCell else { return }
//
//        let text = cell.writeDownField.text
//
//        print(text)

    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        delegate = navigationController?.viewControllers[0] as! Getdelegate
        num = delegate.get()
        
    }
}

extension WriteDownViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ParticipantsListCell else { return UITableViewCell() }
        // 타입캐스팅에 성공할수도있고 실패할수도 있다.
        // tableView.dequeueReusableCell(withIdentifier: "cell") as? ParticipantsListCell 이거 실패하면 nil이다.
        // tableView.dequeueReusableCell(withIdentifier: "cell") as? ParticipantsListCell 이 결과가 nil일수도있고 participantsListCell일수도있다.
        
        
        
        return cell
        
    }
}


class ParticipantsListCell : UITableViewCell {
    
    @IBOutlet weak var writeDownField: UITextField!
    //    @IBAction func mix(_ sender: UIButton) {
    //        if writeDownField.text?.isEmpty == false {
    //            print(writeDownField.text)
    //        }
    //    }
    
}
