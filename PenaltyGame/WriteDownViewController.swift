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
    
    let randomNumber: UInt32 = arc4random_uniform(10) + 1
    
   //var text:[String] = []
    
    
    
    //    func sendData(data: Int) {
    //        p = data
    //    }
    //00

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func mixButton(_ sender: Any) {
        tableView.cellForRow(at: IndexPath)
        
        let text = cell.writeDownField.text
      print(text)
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
