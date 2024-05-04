import UIKit


class Officers {
    func calculateOfficers() -> Double {
        return 0
    }
    var name: String
    var age: Int
    var sex: Bool
    var address: String
    
    init(name: String, age: Int, sex: Bool, address: String) {
        self.name = name
        self.age = age
        self.sex = sex
        self.address = address
    }
}


class Worker: Officers {
    var level: Int
    
    init(name: String, age: Int, sex: Bool, address: String,level: Int) {
        self.level = level
        super.init(name: name, age: age, sex: sex, address: address)
    }
    
    override func calculateOfficers() -> Double {
        return Double(1000 * level * 2/3)
    }
}


class Engnieer: Officers {
    var trainingIndustry: String
    var degree: String
    
    var level: Int = 0
    init(name: String, age: Int, sex: Bool, address: String, trainingIndustry: String, degree: String) {
        self.trainingIndustry = trainingIndustry
        if degree == "Junior" || degree == "Senior" || degree == "Leader" {
            self.degree = degree
        } else {
            self.degree = "Error degree"
        }
      
        super.init(name: name, age: age, sex: sex, address: address)
    }
    
    override func calculateOfficers() -> Double {
        if (self.degree == "Junior") {
            level = 1
        } else if (self.degree == "Senior") {
            level = 2
        } else if (self.degree == "Leader") {
            level = 3
        } else {
            level = 0
        }
        
        switch self.trainingIndustry  {
        case "Mechanical Engineer":
            return Double(800 * level + 100)
            
        case "Software engineer":
            return Double(900 * level + 150)
            
        case "Construction engineer":
            return Double(850 * level + 100)
        default:
            return 0
        }
    }
}


class Employee: Officers {
    var job: String
    var seniority: Int
    
    var numberYear: Int = 0
    init(name: String, age: Int, sex: Bool, address: String, job: String, seniority: Int) {
        self.job = job
        self.seniority = seniority
        super.init(name: name, age: age, sex: sex, address: address)
    }
    
    override func calculateOfficers() -> Double {
        if (1...5 ~= self.seniority) {
            numberYear = 1
        } else if (6...10 ~= self.seniority) {
            numberYear = 2
        } else if (11...20 ~= self.seniority) {
            numberYear = 3
        } else if (21...40 ~= self.seniority) {
            numberYear = 4
        } else {
            numberYear = 0
        }
        
        switch self.job  {
        case "Teacher":
            return Double(600 * numberYear + 100)
        case "clerk":
            return Double(750 * numberYear + 130)
        case "sales agent":
            return Double(760 * numberYear + 150)
        default:
            return 0      
        }
    }
}


class ManagerOfficers {
    var listOfficers :[Officers] = []
    var listSort: [Officers] = []
    
    
    func add(obj: Officers){
        listOfficers.append(obj)
    }
    
    func search(name: String) {
        var list = listOfficers.filter{ obj in
            return obj.name == name
        }
        if list.isEmpty {
            print("not found name: \(name) in list")
        }
        else {
            printList(list: list)
        }
    }
    
    
    func display(){
        printList(list: listOfficers)
    }
    
    func printList(list: [Officers]) {
        for obj in list {
            if let individual = obj as? Worker {
                print("Name: \(individual.name), Age: \(individual.age), Sex: \(individual.sex), Address: \(individual.address), level: \(individual.level), salary:\(individual.calculateOfficers())")
            }
            if let individual = obj as? Engnieer {
                print("Name: \(individual.name), Age: \(individual.age), Sex: \(individual.sex), Address: \(individual.address), trainingIndustry: \(individual.trainingIndustry),degree: \(individual.degree), salary:\(individual.calculateOfficers())")
            }
            if let individual = obj as? Employee {
                print("Name: \(individual.name), Age: \(individual.age), Sex: \(individual.sex), Address: \(individual.address), job: \(individual.job),seniority: \(individual.seniority), salary:\(individual.calculateOfficers())")
            }
        }
    }
    
    func sortBySalaryOfTypeOfficers(obj: String, type: Character){
        switch obj {
        case "Worker":
            listSort = listOfficers.filter({ officer in
                return officer is Worker
            })
        case "Engnieer":
            listSort = listOfficers.filter({ officer in
                return officer is Engnieer
            })
        case "Employee":
            listSort = listOfficers.filter({ officer in
                return officer is Employee
            })
        case "All":
            listSort = listOfficers
            break
        default:
            return
        }
        if type == "u"{
            
            listSort.sort { off1, off2 in
                off1.calculateOfficers() > off2.calculateOfficers()
            }
        } else if type == "d" {
            listSort.sort { off1, off2 in
                off1.calculateOfficers() < off2.calculateOfficers()
            }
        } else {
            print("Error input type please input or 'u': increase salary or 'd':  reduce salary")
            return
        }
        
        printList(list: listSort)
    }
}




let worker1 = Worker(name: "John Doe", age: 30, sex: true, address: "123 Main St", level: 2)
let worker2 = Worker(name: "Alice Smith", age: 25, sex: false, address: "456 Elm St", level: 1)

let engineer1 = Engnieer(name: "Bob Johnson", age: 35, sex: true, address: "789 Oak St", trainingIndustry: "Software engineer", degree: "Senior")
let engineer2 = Engnieer(name: "Emily Brown", age: 28, sex: false, address: "101 Pine St", trainingIndustry: "Mechanical Engineer", degree: "Junior")

let employee1 = Employee(name: "Michael Wilson", age: 40, sex: true, address: "222 Maple St", job: "Teacher", seniority: 7)
let employee2 = Employee(name: "Sarah Davis", age: 32, sex: false, address: "333 Cedar St", job: "clerk", seniority: 15)

let manager = ManagerOfficers()


manager.add(obj: worker1)
manager.add(obj: worker2)
manager.add(obj: engineer1)
manager.add(obj: engineer2)
manager.add(obj: employee1)
manager.add(obj: employee2)




print("list search by name")
var findName: () = manager.search(name: "Nguyen Van A")

print("\n")
print("---list---")
manager.display()


print("\n")
print("---listSort---")
manager.sortBySalaryOfTypeOfficers(obj: "Employee", type: "u")











