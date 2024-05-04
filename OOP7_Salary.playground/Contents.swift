import UIKit

class Officer {
    var fixedSalary, bonus, fines, actualSalary: Double
    var name: String
    var age: Int
    var address: String
    var id: String
    
    init( id: String, fixedSalary: Double, bonus: Double, fines: Double, name: String, age: Int, address: String) {
        self.id = id
        self.fixedSalary = fixedSalary
        self.bonus = bonus
        self.fines = fines
        self.actualSalary = fixedSalary + bonus - fines
        self.name = name
        self.age = age
        self.address = address
        
    }
}

class Manager {
    var teachers: [Officer] = []
    
    func addTeacher(obj: Officer) {
        teachers.append(obj)
    }
    
    func deleteTeacher(id: String) {
        var deleteId = teachers.filter { obj in
            return obj.id != id
        }
        
        for person in deleteId {
            print("id: \(person.id), fixedSalary: \(person.fixedSalary), bonus: \(person.bonus), fines: \(person.fines), actualSalary: \(person.actualSalary),  name:\(person.name), age: \(person.age), address: \(person.address)")
        }
    }
}


var manager = Manager()

var teach1 =  Officer(id: "GV001", fixedSalary: 5000000, bonus: 1000000, fines: 500000,name: "Nguyen Van A", age: 40, address: "DN")
var teach2 = Officer(id: "GV002", fixedSalary: 4500000, bonus: 800000, fines: 200000, name: "Tran Thi B", age: 35, address: "HUE")
var teach3 = Officer(id: "GV003", fixedSalary: 5500000, bonus: 900000, fines: 150000,name: "Le Thi F", age: 40, address: "DN")
var teach4 = Officer(id:  "GV004", fixedSalary: 6000000, bonus: 1200000, fines: 300000, name: "Pham Van E", age: 35, address:  "HCM")


manager.addTeacher(obj: teach1)
manager.addTeacher(obj: teach2)
manager.addTeacher(obj: teach3)
manager.addTeacher(obj: teach4)


manager.deleteTeacher(id: "GV001")

