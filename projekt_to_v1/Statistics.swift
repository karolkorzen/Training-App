//
//  Statistics.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 11/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class Statistics: UIViewController {

    /*
     select max(weight) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
     select max(weight) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
     select max(weight*repeats) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
     */
    
    @IBOutlet weak var outletForTrainingName: UILabel!
    @IBOutlet weak var firstOutlet: UILabel!
    @IBOutlet weak var secondOutlet: UILabel!
    @IBOutlet weak var thirdOutlet: UILabel!
    
    
    func statsHandler (nameofTraining: String) {
        var q1 = [String]()
        var q2 = [String]()
        var q3 = [String]()
        q1 = DBManager.shared.selectMaxWeight(name: nameofTraining)
        q2 = DBManager.shared.selectMaxRepeats(name: nameofTraining)
        q3 = DBManager.shared.selectMaxCombo(name: nameofTraining)
        let ou1 = "Max weight: \(q1[0]) \(q1[1])"
        let ou2 = "Max repeats: \(q2[0]) \(q2[1])"
        let ou3 = "Max summary weight: \(q3[0]) \(q3[1])"
        firstOutlet.text=ou1
        secondOutlet.text=ou2
        thirdOutlet.text=ou3
    }
    var nameofTraining: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        outletForTrainingName.text=nameofTraining
        statsHandler(nameofTraining: nameofTraining)
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
