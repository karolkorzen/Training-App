//
//  newExerAddAlone.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 13/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class newExerAddAlone: UIViewController {
    
    var titlle = String()
    @IBOutlet weak var textField: UITextField!
    @IBAction func confirmAdding(_ sender: Any) {
        DBManager.shared.insertExercise1(insertExer: textField.text ?? "NULL", title: titlle)
    }
    
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
