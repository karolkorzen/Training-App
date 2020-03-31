//
//  AddRecordExtension.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 12/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class AddRecordExtension: UIViewController {

    @IBOutlet weak var asd: UILabel!
    @IBOutlet weak var qwe: UILabel!
    @IBOutlet weak var rty: UILabel!
    @IBOutlet weak var cvb: UILabel!
    
    @IBOutlet weak var exerTitle: UILabel!
    @IBOutlet weak var numberofsetsField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var repeatsField: UITextField!
    @IBAction func confirmchanges(_ sender: UIButton) {
        let id = DBManager.shared.selectIdFromExercise(name: exertit) 
        let setnum = numberofsetsField.text ?? "NULL"
        let wei = weightField.text ?? "NULL"
        let rep = repeatsField.text ?? "NULL"
        
        let insert: String = "\(id),\(setnum),\(wei),\(rep)"
        
        DBManager.shared.insertRecordToSet(insert: insert)
    }
    
    var exertit = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        exerTitle.text = exertit
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
