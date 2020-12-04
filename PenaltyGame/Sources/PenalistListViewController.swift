//
//  PenalistListViewController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/11/23.
//  Refactory by 이종영 on 2020/12/03
//

import UIKit
class PenalistListViewController: UITableViewController {
    
    var rowCount: Int?
    var data = [String](repeating: "Name", count: 10)
    
    lazy var list: [PenalistInfo] = {
        var datalist = [PenalistInfo]()
        var index = 1
        for name in self.data {
            let penalist = PenalistInfo()
            penalist.num += index
            penalist.name = name
            datalist.append(penalist)
            if rowCount == index {
                break
            }
            index += 1
        }
        return datalist
    }()
    
    func randomInt(min: Int = 0, _ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }

    @objc private func moveResultController(_ sender: Any) {
        guard let resultController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            return
        }
        
        //data가 아닌 list에 참조하여 name 추출
        resultController.penalistName = data[randomInt(self.rowCount ?? 0)]
        
        self.navigationController?.pushViewController(resultController, animated: true)
    }
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "결과 보기", style: .plain, target: self, action: #selector(moveResultController(_:)))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let num = cell.viewWithTag(1) as? UILabel
        let name = cell.viewWithTag(2) as? UITextField
        
        num?.text = String(row.num)
        name?.text = row.name
        //TODO: CellControll에 row.name 넘겨줌
        return cell
    }
}
