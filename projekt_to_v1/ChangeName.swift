//
//  ChangeName.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 12/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class ChangeName: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func confirm(_ sender: UIButton) {
        DBManager.shared.updateExerName(old: exertit, insert: textField.text ?? "NULL")
    }
    
    @IBAction func confirmDelete(_ sender: UIButton) {
        DBManager.shared.deleteExercise(old: exertit)
    }
    
    @IBOutlet weak var textFieldInsert: UITextField!
    
    @IBAction func confirminserting(_ sender: UIButton) {
        DBManager.shared.insertExercise(insert: textFieldInsert.text ?? "NULL", exername: exertit)
    }
    
    @IBOutlet weak var changeNameTextField: UITextField!
    @IBAction func confirmChangingName(_ sender: UIButton) {
        let q = DBManager.shared.selectTitleTrainingFromExercise(name: exertit)
        DBManager.shared.updateTrainingName(old: q, insert: changeNameTextField.text ?? "NULL")
    }
    
    var exertit = String()
    override func viewDidLoad() {
        super.viewDidLoad()

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
