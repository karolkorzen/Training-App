//
//  DisplayTraining.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 11/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit




class TrainingStructure: UITableViewController {
    
    var exertit = String()

    struct cell {
        var opened = Bool()
        var title = String()                //exercise
        var sectionData = [String]()        //weight x repeats
        var numberOfSet = [Int]()
        var weight = [Double]()
        var repeats = [Double]()
        
    }

    func loadTraining(nameTraining: String) -> [cell]{
        if DBManager.shared.openDatabase() {
            var tableViewData = [cell]()
            let nameTraining=exertit
            let exerNames: [String] = DBManager.shared.selectExercisesFromTraining(title: nameTraining)
            for word in exerNames{
                print(word)
                let idExer: Int = DBManager.shared.selectIdFromExercise(name: word)
                print (idExer)
                let weight:[Double] = DBManager.shared.selectWeightFromSets(index: idExer)
                let repeats:[Double] = DBManager.shared.selectRepeatsFromSets(index: idExer)
                let numberOfSet:[Int] = DBManager.shared.selectNumberOFSetFromSets(index: idExer)
                var weightsRepeats = [String]()
                for (index1, index11) in zip(weight, repeats) {
                    weightsRepeats.append("\(index1) x \(index11)")
                }
                tableViewData.append(cell(opened: false, title: word, sectionData: weightsRepeats,numberOfSet: numberOfSet, weight: weight, repeats: repeats))
                
            }
            //.append(results.string(forColumn: "id_training") ?? "NULL")
            return tableViewData
                
            }

        return [cell(opened: false, title: "dziala?", sectionData: ["chyba nie"])]
    }
    
    var tableViewData = [cell]()
    var idTraining: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData=loadTraining(nameTraining: idTraining)
        //tableViewData = [cell(opened: false, title: "testTitle1", sectionData: ["testSection1", "testSection2", "testSection3"])]
        //tableViewData.append(cell(opened: false, title: "testTitle2", sectionData: ["testSection11", "testSection22", "testSection33"]))
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0 {
            guard let cellInView = tableView.dequeueReusableCell(withIdentifier: "cellInView") else {
                return UITableViewCell()
            }
            cellInView.textLabel?.text = tableViewData[indexPath.section].title
            return cellInView
        } else {
            guard let cellInView = tableView.dequeueReusableCell(withIdentifier: "cellInView") else {
                return UITableViewCell()
            }
            var str: String = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            str.append(" Set \(tableViewData[indexPath.section].numberOfSet[indexPath.row - 1])")
            cellInView.textLabel?.text = str
            //cellInView.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cellInView
            }
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
                let sc = storyboard?.instantiateViewController(withIdentifier: "ChangeName") as? ChangeName
                sc?.exertit=tableViewData[indexPath.section].title
                self.navigationController?.pushViewController(sc!, animated: true)
                /*
                if tableViewData[indexPath.section].opened==true {
                    tableViewData[indexPath.section].opened=false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none) //animation ?
                } else {
                    tableViewData[indexPath.section].opened=true
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                    */ //animation ?
                } /*
            } else {
                print(tableViewData[indexPath.section].title)
                print(tableViewData[indexPath.section].sectionData)
                print(tableViewData[indexPath.section].weight)
                print(tableViewData[indexPath.section].repeats)
                print(tableViewData[indexPath.section].numberOfSet)
                let sc = storyboard?.instantiateViewController(withIdentifier: "AddRecordExtension") as? AddRecordExtension
                sc?.exertit=tableViewData[indexPath.section].title
                self.navigationController?.pushViewController(sc!, animated: true)
            }*/
            
            
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
