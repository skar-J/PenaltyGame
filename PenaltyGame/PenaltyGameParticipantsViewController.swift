//
//  PenaltyGameParticipantsViewController.swift
//  PenaltyGame
//
//  Created by 반지윤 on 2020/11/23.
//

import UIKit

class PenaltyGameParticipantsViewController: UIViewController, SendDataDelegate {
   
    var p = 1
    
    func sendData(data: Int) {
        p = data
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = ["1","2","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension PenaltyGameParticipantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return p
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ParticipantsListCell else { return UITableViewCell() }
        
        return cell
        
    }
}


class ParticipantsListCell : UITableViewCell {
    
    @IBOutlet weak var participantsList: UITextField!
    
}
