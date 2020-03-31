//
//  DBManager.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 04/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit


class DBManager: NSObject {
    static let shared: DBManager = DBManager()
    
    let databaseFileName = "database.db"
     
    //var pathToDatabase: String! = "/Users/karolkorzen/Developer/SQL/database"
    var pathToDatabase: String! = "/Users/karolkorzen/Developer/projekt_to_v1/projekt_to_v1"




    
    var database: FMDatabase!

    
    /*override init() {
        super.init()
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        print("pathToDatabase = \(pathToDatabase)")
    }*/
    override init() {
    
        super.init()
        
        pathToDatabase = "/Users/karolkorzen/Developer/SQL/database/database.db"
        //print("pathToDatabase = \(pathToDatabase)")
    }
    
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                print("database opened")
                return true
            }
        }
        print("not ok")
        return false
    }
    func select() {
        if openDatabase() {
            let query = "select * from Training"
            
            let results = database.executeQuery(query, withParameterDictionary: nil)
                
            let ret =  results!.columnCount
            print ("Select:")
            print (ret)
            
            }
    }
    func addNewTraining(insert: String) {
        if openDatabase() {
            let query = "insert into Training (Title) values ('\(insert)')"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {print("INSERT FAILED, tried to do \(query)")}
        }
    }
    
    func selectTrainings() -> [String] {
        if openDatabase() {
            var tab: [String] = []
            let query = "select Title from Training"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    tab.append(results.string(forColumn: "Title") ?? "NULL")
                }
                return tab
            }
            catch {
                print("INSERT FAILED, tried to do \(query)")
                
            }
        }
        return ["Power","Strength","Cardio", "Interval"]
    }
    
    func updateTrainingName(old:String, insert: String){
        if openDatabase() {
            let query = "update Training set Title='\(insert)' where Title='\(old)'"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {
                print("UPDATE FAILED, tried to do \(query)")
            }
        }
    }
    
    func selectIDfromTraining (title: String) -> Int
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = Int32()

            let query = "select idTraining from Training where Title='\(title)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result=results.int(forColumn: "idTraining")
                }
                return Int(result)
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return -1
    }
    
    func selectExercisesFromTraining(title: String) -> [String] {
        if openDatabase() {
            var tab: [String] = []
            let id: Int = selectIDfromTraining(title: title)
            let query = "select name from Exercise where id_training=\(id)"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("There is Executed query: \(query)")
                while (results.next()) {
                    tab.append(results.string(forColumn: "name") ?? "NULL")
                }
                return tab
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return ["Power","Strength","Cardio", "Interval"]
    }
    
    func selectIdFromExercise (name: String) -> Int
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = Int32()

            let query = "select id_exercise from Exercise where name='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result=results.int(forColumn: "id_exercise")
                }
                return Int(result)
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return -1
    }
    
    func selectWeightFromSets(index: Int) -> [Double] {
        if openDatabase() {
            var tab: [Double] = []
            let query = "select * from `Set` where id_exercise='\(index)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    tab.append(results.double(forColumn: "weight"))
                }
                return tab
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return [0.1,1.2,2.3,3.4]
    }
    
    func selectRepeatsFromSets(index: Int) -> [Double] {
        if openDatabase() {
            var tab: [Double] = []
            let query = "select * from `Set` where id_exercise='\(index)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    tab.append(results.double(forColumn: "repeats"))
                }
                return tab
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        } 
        return [1.1,2.2,3.3,4.4]
    }
    func selectNumberOFSetFromSets(index: Int) -> [Int] {
        if openDatabase() {
            var tab: [Int] = []
            let query = "select * from `Set` where id_exercise='\(index)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    tab.append((Int(results.int(forColumn: "number_of_set"))))
                }
                return tab
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return [6,6,6,6]
    }
    
    func selectIDOFSetFromSets(index: Int) -> [Int] {
        if openDatabase() {
            var tab: [Int] = []
            let query = "select * from `Set` where id_exercise='\(index)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    tab.append((Int(results.int(forColumn: "id_set"))))
                }
                return tab
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return [6,6,6,6]
    }
    
    func insertRecordToSet(insert: String) {
        if openDatabase() {
            let query = "insert into `Set` (id_exercise, number_of_set, weight, repeats) values (\(insert))"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {print("INSERT FAILED, tried to do \(query)")}
        }
    }
    /*
    select max(weight) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
    select max(weight) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
    select max(weight*repeats) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title=\(title)
    */
    
    
    
    func selectMaxWeight (name: String) -> [String]
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = [String]()
            let query = "select max(weight) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result.append(String(results.int(forColumn: "maks")))
                    result.append(String(results.string(forColumn: "name") ?? "NULL"))
                }
                return result
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
            }
        }
        return ["???"]
    }
    
    func selectMaxRepeats (name: String) -> [String]
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = [String]()
            let query = "select max(repeats) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result.append(String(results.int(forColumn: "maks")))
                    result.append(String(results.string(forColumn: "name") ?? "NULL"))
                }
                return result
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
            }
        }
        return ["???"]
    }
    
    func selectMaxCombo (name: String) -> [String]
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = [String]()
            let query = "select max(weight*repeats) as maks, * from `Set` inner join Exercise on `Set`.id_exercise = Exercise.id_exercise inner join Training on Exercise.id_training=Training.idTraining where Training.Title='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result.append(String(results.int(forColumn: "maks")))
                    result.append(String(results.string(forColumn: "name") ?? "NULL"))
                }
                return result
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
            }
        }
        return ["???"]
    }
    
    
    func updateExerName(old:String, insert: String){
        if openDatabase() {
            let query = "update Exercise set name='\(insert)' where name='\(old)'"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {
                print("UPDATE FAILED, tried to do \(query)")
            }
        }
    }
    
    //let query = "delete from movies where \(field_MovieID)=?"
    func deleteTraining(old:String){
        if openDatabase() {
            
            let query = "delete from Training where Title='\(old)'"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {
                print("UPDATE FAILED, tried to do \(query)")
            }
        }
    }
    
    func deleteExercise(old:String){
        if openDatabase() {
            
            let query = "delete from Exercise where name='\(old)'"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {
                print("UPDATE FAILED, tried to do \(query)")
            }
        }
    }
    
    func selectIdTrainingFromExercise (name: String) -> Int
    {
        if openDatabase() {
            //var tab: [String] = []
            var result = Int32()

            let query = "select id_training from Exercise where name='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result=results.int(forColumn: "id_training")
                }
                return Int(result)
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return -1
    }
    
    func insertExercise(insert: String, exername: String) {
        if openDatabase() {
            let idTrain = DBManager.shared.selectIdTrainingFromExercise(name: exername)
            let query = "insert into Exercise (id_training, name) values (\(idTrain), '\(insert)')"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {print("INSERT FAILED, tried to do \(query)")}
        }
    }
    
    func insertExercise1(insertExer: String, title: String) {
        if openDatabase() {
            let idTrain = DBManager.shared.selectIDfromTraining(title: title)
            let query = "insert into Exercise (id_training, name) values (\(idTrain), '\(insertExer)')"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {print("INSERT FAILED, tried to do \(query)")}
        }
    }
    
    func deleteSet(lol:String, lol3:String){
        if openDatabase() {
            let lol2 = DBManager.shared.selectIdFromExercise(name: lol)
            let query = "delete from `Set` where id_exercise='\(lol2)' and number_of_set='\(lol3)'"
            do {
                try database.executeUpdate(query, values: nil)
                print ("Executed query: \(query)")
            }
            catch {
                print("DELETE FAILED, tried to do \(query)")
            }
        }
    }
    
    func selectTitleTrainingFromExercise (name: String) -> String {
        if openDatabase() {
            //var tab: [String] = []
            var result = String()

            let query = "select title from Exercise join Training on Exercise.id_training = Training.idTraining where name='\(name)'"
            do {
                let results=try database.executeQuery(query, values: nil)
                print ("Executed query: \(query)")
                while (results.next()) {
                    result=results.string(forColumn: "title") ?? "NULL"
                }
                return result
            }
            catch {
                print("SELECT FAILED, tried to do \(query)")
                
            }
        }
        return "NULL"
        
    }
    
}
    
    
    

