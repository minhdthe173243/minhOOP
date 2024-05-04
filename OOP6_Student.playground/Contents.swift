import UIKit

class Student {
    var name: String
    var age: Int
    var address: String
    
    init(name: String, age: Int, address: String) {
        self.name = name
        self.age = age
        self.address = address
    }
}


class Room {
    var student: [Student] = []
    
    
    func addStudent(obj: Student) {
        student.append(obj)
    }
    
    func printList(obj: [Student]) {
        for stu in obj {
            print("name:\(stu.name) age:\(stu.age), address:\(stu.address) ")
        }
    }
    
    func searchStudent20Age()  {
        var search = student.filter { obj in
            return obj.age == 20
        }
        printList(obj: search)
    }
    
    func countStudent23Age() {
        var count = student.filter { obj in
            return obj.age == 23 && obj.address == "DN"
        }
        print("the number of students is 23 years old and is from DN: \(count.count) ")
        print("\n")
        printList(obj: count)
    }
}



var room = Room()

var stu1 = Student(name: "Nguyen Van A", age: 23, address: "DN")
var stu2 = Student(name: "Tran Thi B", age: 23, address: "DN")
var stu3 = Student(name: "Le Van C", age: 20, address: "HUE")
var stu4 = Student(name: "Nguyen Van D", age: 23, address: "HN")
var stu5 = Student(name: "Nguyen Van E", age: 20, address: "HN")
var stu6 =  Student(name: "Nguyen Van G", age: 20, address: "HN")

room.addStudent(obj: stu1)
room.addStudent(obj: stu2)
room.addStudent(obj: stu3)
room.addStudent(obj: stu4)
room.addStudent(obj: stu5)
room.addStudent(obj: stu6)

print("--List student have age = 20----")
room.searchStudent20Age()


print("\n")
print("--count student has age = 23 and address: DN----")
room.countStudent23Age()

