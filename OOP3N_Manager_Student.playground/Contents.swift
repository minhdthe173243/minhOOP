import UIKit


class Student {
    var id: Int
    var name: String
    var address: String
    var priorityLevel: Int
    
    init(id: Int, name: String, address: String, priorityLevel: Int) {
        self.id = id
        self.name = name
        self.address = address
        self.priorityLevel = priorityLevel
    }
}


class CandidateA: Student{
    var subject: String = "Toan, Li, Hoa"
    override init(id: Int, name: String, address: String, priorityLevel: Int) {
        super.init(id: id, name: name , address: address, priorityLevel: priorityLevel)
    }
}


class CandidateB: Student{
    var subject: String =  "Toan, Hoa, Sinh"
    override init(id: Int, name: String, address: String, priorityLevel: Int) {
        super.init(id: id, name: name , address: address, priorityLevel: priorityLevel)
    }
}



class CandidateC: Student{
    var subject: String = "Van, Su, Dia"
    override init(id: Int, name: String, address: String, priorityLevel: Int) {
        super.init(id: id, name: name , address: address, priorityLevel: priorityLevel)
    }
}



class Manager {
    var list: [Student] = []
    
    func addStudent(sub: Student) {
            list.append(sub)
    }
    
    func printList(arr: [Student]) {
        for sub in arr {
            if let obj = sub as? CandidateA {
                print("id: \(obj.id), name:\(obj.name), address: \(obj.address), priority: \(obj.priorityLevel), subject: \(obj.subject)")
            }
            
            else if let obj = sub as? CandidateB {
                print("id: \(obj.id), name:\(obj.name), address: \(obj.address), priority: \(obj.priorityLevel), subject: \(obj.subject)")
            }
            else if let obj = sub as? CandidateC {
                print("id: \(obj.id), name:\(obj.name), address: \(obj.address), priority: \(obj.priorityLevel), subject: \(obj.subject)")
            }
        }
    }
    
    
    
    func display() {
        printList(arr: list)
    }
    
    
    func deleteById(id: Int) {
        let listById = list.filter{ student in
            return student.id != id
        }
        printList(arr: listById)
    }
}




let student1 = CandidateA(id: 1, name: "Nguyễn Văn A", address: "Hà Nội", priorityLevel: 1)
let student2 = CandidateB(id: 2, name: "Trần Thị B", address: "Hải Phòng", priorityLevel: 2)
let student3 = CandidateC(id: 3, name: "Lê Văn C", address: "Đà Nẵng", priorityLevel: 3)
let student4 = CandidateA(id: 4, name: "Phạm Thị D", address: "Hồ Chí Minh", priorityLevel: 1)
let student5 = CandidateA(id: 5, name: "Hoàng Văn E", address: "Cần Thơ", priorityLevel: 2)
let student6 = CandidateC(id: 6, name: "Mai Thị F", address: "Hà Tĩnh", priorityLevel: 3)



let manager = Manager()

manager.addStudent(sub: student1)
manager.addStudent(sub: student2)
manager.addStudent(sub: student3)
manager.addStudent(sub: student4)
manager.addStudent(sub: student5)
manager.addStudent(sub: student6)


print("----disPlay----")
manager.display()

print("----DeleteById----")
manager.deleteById(id: 1)




















