//
//  CreateTraining_ViewController.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 02/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class CreateTraining_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //var data_tabela: [String] = ["Power","Strength","Cardio", "Interval"]
    var data_tabela: [String] = DBManager.shared.selectTrainings()
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBAction func ConfirmCreating(_ sender: UIButton) {
        //print(TextField.text ?? "Pusto")
        let insert = TextField.text ?? "NULL"
        DBManager.shared.addNewTraining(insert: insert)
    }
    
    @IBAction func confirmDeleting(_ sender: UIButton) {
        let insert = TextField.text ?? "NULL"
        DBManager.shared.deleteTraining(old: insert)
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //DBManager.shared.openDatabase()
        //DBManager.shared.select()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /*let alertController = UIAlertController(title: "Info", message: "You chose training \(data_tabela[indexPath.row])", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok!", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil )*/

        let sc = storyboard?.instantiateViewController(withIdentifier: "ManageTraining") as? ManageTraining
        sc?.sceneTitle=data_tabela[indexPath.row]
        self.navigationController?.pushViewController(sc!, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_tabela.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = data_tabela[indexPath.row]
        cell.textLabel?.text=text
        return cell
    }
}
