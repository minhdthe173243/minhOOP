import UIKit


class ListResult {
    var semester: String
    var gpa: Double
    
    init(semester: String, gpa: Double) {
        self.semester = semester
        self.gpa = gpa
    }
}

class Student {
    var id: String
    var fullName: String
    var doB: Date
    var yearOfAdmission: Int
    var entryPoint: Double
    var listResult: [ListResult]
    
    init(id: String, fullName: String, doB: String, yearOfAdmission: Int, entryPoint: Double, listResult: [ListResult]) {
        self.id = id
        self.fullName = fullName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: doB)!
        self.doB = date
        
        self.yearOfAdmission = yearOfAdmission
        self.entryPoint = entryPoint
        self.listResult = listResult
    }
    
    func showMyInfor() {
        print("id: \(id), Full Name: \(fullName), Date of Birth: \(doB), yearOfAdmission: \(yearOfAdmission),entryPoint: \(entryPoint)")
        for result in listResult {
            print("Semester: \(result.semester), GPA: \(result.gpa)")
        }
    }
    
    func getGPA(semester: String) -> Double{
        if let result = listResult.first(where: { $0.semester == semester }) {
            return result.gpa
        }
        return 0
    }
    
    
}


class FormalStudent: Student {
    override init(id: String, fullName: String, doB: String, yearOfAdmission: Int, entryPoint: Double, listResult: [ListResult]) {
        super.init(id: id, fullName: fullName, doB: doB, yearOfAdmission: yearOfAdmission, entryPoint: entryPoint, listResult: listResult)
    }
    override func showMyInfor() {
        super.showMyInfor()
    }
}

class InServiceStudent: Student {
    var trainingJointPlace: String
    
    init(id: String, fullName: String, doB: String, yearOfAdmission: Int, entryPoint: Double, trainingJointPlace: String, listResult: [ListResult]) {
        self.trainingJointPlace = trainingJointPlace
        super.init(id: id, fullName: fullName, doB: doB, yearOfAdmission: yearOfAdmission, entryPoint: entryPoint, listResult: listResult)
    }
    override func showMyInfor() {
        super.showMyInfor()
        print("trainingJointPlace : \(trainingJointPlace)")
    }
}


class Room {
    var facultyName: String
    var student: [Student]
    init(facultyName: String, student: [Student]) {
        self.facultyName = facultyName
        self.student = student
    }
}



class managerStudent {
    var listRoom: [Room] = []
    
    func printList(list: [Student]) {
        for stu in list {
           if let obj = stu as? FormalStudent {
                    obj.showMyInfor()
                }
                else if let obj = stu as? InServiceStudent {
                    obj.showMyInfor()
                }
            }
 
    }
    // 3
    func addStudent(room: Room){
        listRoom.append(room)
    }
    
    // 4
    func testFormalStudent(stu: Student) {
        if stu is FormalStudent {
            print("this is FormalStudent")
        } else {
            print("this not is FormalStudent")
        }
    }
    
    // 6
    func getGPAStudentBasedSemester(id: String, semester:String ) {
        for room in listRoom {
            for stu in room.student {
                if stu.id == id {
                   print("\(stu.getGPA(semester: semester))")
                }
            }
        }
    }
    
    // 7
    
    func countFormalStudent() {
        var count = 0
        for room in listRoom {
            var listFormalStudent = room.student.compactMap({$0 as? FormalStudent})
            count += listFormalStudent.count
        }
        print(count)
    }
    
    // 8
    
    func highestEntryScore() {
        var listHighestEntryScore: [Student] = []
        for room in listRoom {
            if let stu = room.student.max(by: {
                $0.entryPoint < $1.entryPoint
            }){
                listHighestEntryScore.append(stu)
            }
        }
        printList(list: listHighestEntryScore)
    }
    
    // 9
    
    func listOfInServiceStudent() {
        var listInServiceStudent: [Student] = []
        for room in listRoom {
            let stu = room.student.filter { $0 is InServiceStudent }
            listInServiceStudent.append(contentsOf:stu)
        }
        
        printList(list: listInServiceStudent)
    }
    
    
    func getHighestGPALatestSemester() {
        var highGPAStudents: [Student] = []
        for room in listRoom {
            for stu in room.student {
                if let latestScore = stu.listResult.last {
                    if latestScore.gpa >= 8 {
                        highGPAStudents.append(stu)
                    }
                }
            }
        }
        
        printList(list: highGPAStudents)
    }
    
    // 11
    func highestGPA() {
        var listHighGPA:[Student] = []
        for room in listRoom {
            if let maxKey = room.student.max(by: { highestGPAEachStudent(stu:$0) < highestGPAEachStudent(stu:$1) }){
                    listHighGPA.append(maxKey)
                }
        }
        
        printList(list: listHighGPA)
    }
    
    func highestGPAEachStudent(stu: Student) -> Double{
        if let score = stu.listResult.max(by: { $0.gpa < $1.gpa  }) {
            return score.gpa
        } else {
            return 0.0
        }
            
    }
    // 12
    func sortStudentByYear() {
        var listFormalStudent :[Student] = []
        for room in listRoom {
             listFormalStudent = room.student.sorted(by: {
                return ($0.yearOfAdmission > $1.yearOfAdmission)
            })
        }
        printList(list: listFormalStudent)
    }
    
    
    func countStudentsByYear(year: Int)  {
        var count = 0
        for room in listRoom {
            for stu in room.student {
                if stu.yearOfAdmission == year {
                    count += 1
                }
            }
        }
        print("yearOfAdmission \(year): \(count)")
    }
}


let record1 = ListResult(semester: "Semester 1", gpa: 7.5)
let record3 = ListResult(semester: "Semester 1", gpa: 8.5)
let record5 = ListResult(semester: "Semester 1", gpa: 8.9)
let record7 = ListResult(semester: "Semester 1", gpa: 7.5)

let record2 = ListResult(semester: "Semester 2", gpa: 8.5)
let record4 = ListResult(semester: "Semester 2", gpa: 9.9)
let record6 = ListResult(semester: "Semester 2", gpa: 9.2)
let record8 = ListResult(semester: "Semester 2", gpa: 6.8)

let record9 = ListResult(semester: "Semester 3", gpa: 7.9)
let record10 = ListResult(semester: "Semester 3", gpa: 8.7)
let record11 = ListResult(semester: "Semester 3", gpa: 9.2)
let record12 = ListResult(semester: "Semester 3", gpa: 8.9)








let student1 = FormalStudent(id: "1001", fullName: "Đặng Văn H", doB: "20/05/1998", yearOfAdmission: 2020, entryPoint: 8.0, listResult: [record1, record2,record12])

let student2 = InServiceStudent(id: "2001", fullName: "Jane Smith", doB: "15/08/1997", yearOfAdmission: 2019, entryPoint: 7.5, trainingJointPlace: "Cà Mau", listResult: [record1, record6,record10])

let student3 = InServiceStudent(id: "2002", fullName: "Alice Johnson", doB: "10/10/1996", yearOfAdmission: 2021, entryPoint: 8.8, trainingJointPlace: "DN", listResult: [record3, record4, record11])

let student4 = FormalStudent(id: "SV001", fullName: "Nguyễn Văn A", doB: "01/01/2000", yearOfAdmission: 2020, entryPoint: 8.5, listResult: [record1, record4,record9])

let student5 = FormalStudent(id: "SV002", fullName: "Trần Thị B", doB: "02/02/1999", yearOfAdmission: 2019, entryPoint: 7.9, listResult: [record3, record4,record12])

let student6 = InServiceStudent(id: "SV003", fullName: "Lê Văn C", doB: "03/03/1998", yearOfAdmission: 2018, entryPoint: 9.2, trainingJointPlace: "HN", listResult: [record3, record7,record8,record9])

let student7 = InServiceStudent(id: "SV004", fullName: "Phạm Thị D", doB: "04/04/2001", yearOfAdmission: 2021, entryPoint: 8.7, trainingJointPlace: "HCM", listResult: [record5, record6])

let student8 = FormalStudent(id: "SV005", fullName: "Hoàng Văn E", doB: "05/05/1997", yearOfAdmission: 2017, entryPoint: 9.5, listResult: [record2, record7, record12])

let student9 = InServiceStudent(id: "SV006", fullName: "Nguyễn Thị F", doB: "06/06/2000", yearOfAdmission: 2019, entryPoint: 8.0,trainingJointPlace: "HCM", listResult: [record3, record8, record10])

let student10 = InServiceStudent(id: "SV007", fullName: "Vũ Thị G", doB: "07/07/1999", yearOfAdmission: 2020, entryPoint: 8.8,trainingJointPlace: "Hue", listResult: [record5, record4,record11])


var manager = managerStudent()

manager.addStudent(room: Room(facultyName: "Công nghệ thông tin", student: [student1,student2,student3]))
                   
manager.addStudent(room: Room(facultyName: "Luat", student: [student4,student5,student6]))

manager.addStudent(room: Room(facultyName: "Kinh Te", student: [student7,student8,student9, student10]))

// 4 test FormalStudent
print("-- Test FormalStudent --")
manager.testFormalStudent(stu: student8)


//  6 Get the average score of students' subjects based on the given semester
print("\n\n")
print("Get the average score of students' subjects based on the given semester")
manager.getGPAStudentBasedSemester(id: "SV007", semester: "Semester 3")


// 7
print("\n\n")
print("total number of students of the department")
manager.countFormalStudent()

// 8

print("\n\n")
print("Find the student with the highest score in each department")
manager.highestEntryScore()


//9
print("\n\n")
print("In each department, get a list of in-service students at the joint training place before")
manager.listOfInServiceStudent()


//10
print("\n\n")
print("Get a list of students with an average score in the most recent semester of 8.0 or higher")
manager.getHighestGPALatestSemester()


//11
print("\n\n")
print("In each department, find the student with the highest semester average")
manager.highestGPA()

// 12

print("\n\n")
print("Sort the list of students in descending order by year of admission")
manager.sortStudentByYear()

print("\n\n")
print("In each department, calculate the number of students by year of admission")
manager.countStudentsByYear(year: 2020)
