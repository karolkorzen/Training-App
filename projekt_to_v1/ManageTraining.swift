//
//  ManageTraining.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 11/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class ManageTraining: UIViewController {

    var sceneTitle: String = ""
    @IBOutlet weak var sceneTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneTitleLabel.text=sceneTitle
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ManageButton(_ sender: UIButton) {
        let sc = storyboard?.instantiateViewController(withIdentifier: "TrainingStructure") as? TrainingStructure
        sc?.exertit=sceneTitle
        self.navigationController?.pushViewController(sc!, animated: true)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        let sc = storyboard?.instantiateViewController(withIdentifier: "AddRecord") as? AddRecord
        sc?.idTraining=sceneTitle
        self.navigationController?.pushViewController(sc!, animated: true)
    }
    
    @IBAction func statsButton(_ sender: UIButton) {
        let sc = storyboard?.instantiateViewController(withIdentifier: "Statistics") as? Statistics
        sc?.nameofTraining=sceneTitle
        self.navigationController?.pushViewController(sc!, animated: true)
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        let sc = storyboard?.instantiateViewController(withIdentifier: "DisplayTraining") as? DisplayTraining
        sc?.idTraining=sceneTitle
        self.navigationController?.pushViewController(sc!, animated: true)
    }
    
    @IBAction func newExerciseAdd(_ sender: UIButton) {
        let sc = storyboard?.instantiateViewController(withIdentifier: "newExerAddAlone") as? newExerAddAlone
        sc?.titlle=sceneTitle
        self.navigationController?.pushViewController(sc!, animated: true)

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
