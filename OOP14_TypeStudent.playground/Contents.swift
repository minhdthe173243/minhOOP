import UIKit

class Student {
    var fullName: String
    var doB: Date
    var sex: String
    var phoneNumber: Int
    var universityName: String
    var gradeLevel: String
    
    init(fullName: String, doB: String, sex: String, phoneNumber: Int, universityName: String, gradeLevel: String) {
        self.fullName = fullName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: doB)!
        self.doB = date
        
        self.sex = sex
        self.phoneNumber = phoneNumber
        self.universityName = universityName
        self.gradeLevel = gradeLevel
    }
    func showMyInfor() {
        print("Full Name: \(fullName), Date of Birth: \(doB), Sex: \(sex), Phone Number: \(phoneNumber), University Name: \(universityName), Grade Level: \(gradeLevel)")
    }
}


class GoodStudent: Student {
    var gpa: Double
    var bestRewardName: String
    
    init(fullName: String, doB: String, sex: String, phoneNumber: Int, universityName: String, gradeLevel: String, gpa: Double, bestRewardName: String) {
        self.gpa = gpa
        self.bestRewardName = bestRewardName
        super.init(fullName: fullName, doB: doB, sex: sex, phoneNumber: phoneNumber, universityName: universityName, gradeLevel: gradeLevel)
    }
    override func showMyInfor() {
        super.showMyInfor()
        print("GPA: \(gpa), Best Reward Name: \(bestRewardName)")
    }
}

class NormalStudent: Student {
    var englishScore: Double
    var entryTestScore: Double
    
    init(fullName: String, doB: String, sex: String, phoneNumber: Int, universityName: String, gradeLevel: String, englishScore: Double, entryTestScore: Double) {
        self.englishScore = englishScore
        self.entryTestScore = entryTestScore
        
        super.init(fullName: fullName, doB: doB, sex: sex, phoneNumber: phoneNumber, universityName: universityName, gradeLevel: gradeLevel)
    }
    override func showMyInfor() {
        super.showMyInfor()
        
        print("English Score: \(englishScore), Entry Test Score: \(entryTestScore)")
    }
}


class managerSelectStudent {
    var listStudent: [Student] = []
    
    func addStudent(stu: Student){
        if !listStudent.contains(where: { $0.fullName == stu.fullName }) && listStudent.count < 15 {
              listStudent.append(stu)
          } else {
              print("System input enough students or input same name.")
          }
    }
    
    func selectStudent(number: Int) {
        var listGoodStudent = listStudent.compactMap({
            $0 as? GoodStudent
        })
        
        var listNormalStudent = listStudent.compactMap({
            $0 as? NormalStudent
        })
        
        
        if listGoodStudent.count <= number {
            printList(list: listGoodStudent )
            if number > listGoodStudent.count {
                var count = number - listGoodStudent.count
                var listNomaleSlect = listNormalStudent.sorted(by: {
                    ($0.entryTestScore, $0.englishScore, $0.fullName) > ($1.entryTestScore, $1.englishScore, $1.fullName)
                })
                
                var listGetNormal = Array(listNomaleSlect.prefix(count + 1))
                
                printList(list: listGetNormal )
            }
        }
        
        else if listGoodStudent.count > number {
            var count  = listGoodStudent.count  - number
            var listGoodSelect = listGoodStudent.sorted(by: {
                ($0.gpa, $0.fullName) > ($1.gpa, $1.fullName)
            } )
            
            var listGetGood = Array(listGoodSelect.prefix(count + 1))
            printList(list: listGetGood )
        }
        
    }
    
    
    func printList(list: [Student]){
        for stu in list {
            if let obj  = stu as?  GoodStudent {
                obj.showMyInfor()
            }
            
            if let obj  = stu as? NormalStudent {
                obj.showMyInfor()
            }
        }
        
    }
    
    
    func display() {
        var sortList = listStudent.sorted { ($0.fullName, $1.phoneNumber) < ($1.fullName,$0.phoneNumber)
        }
        printList(list: sortList)
    }

}



let goodStudent1 = GoodStudent(fullName: "John Doe", doB: "01/01/1990", sex: "Male", phoneNumber: 0901234567, universityName: "ABC University", gradeLevel: "Good", gpa: 9.5, bestRewardName: "Scholarship")
let goodStudent2 =  GoodStudent(fullName: "Jane Smith", doB: "02/02/1995", sex: "Female", phoneNumber: 0987654321, universityName: "XYZ College", gradeLevel: "Good", gpa: 9.2, bestRewardName: "Gold Medal")
let goodStudent3 =  GoodStudent(fullName: "Michael Brown", doB: "05/05/1992", sex: "Male", phoneNumber: 0987654321, universityName: "LMN University", gradeLevel: "Good", gpa: 8.7, bestRewardName: "Excellence Award")
let goodStudent4 =  GoodStudent(fullName: "Emily Wilson", doB: "06/06/1994", sex: "Female", phoneNumber: 0912345678, universityName: "OPQ College", gradeLevel: "Good", gpa: 8.3, bestRewardName: "Dean's List")

let goodStudent5 =  GoodStudent(fullName: "Olivia Martinez", doB: "09/09/1990", sex: "Female", phoneNumber: 0912345678, universityName: "XYZ University", gradeLevel: "Good", gpa: 9.0, bestRewardName: "President's Award")
let goodStudent6 =  GoodStudent(fullName: "Daniel Rodriguez", doB: "10/10/1995", sex: "Male", phoneNumber: 0387654321, universityName: "ABC College", gradeLevel: "Good", gpa: 8.5, bestRewardName: "Honors Scholarship")
let goodStudent7 =  GoodStudent(fullName: "Emma Wilson", doB: "01/01/1993", sex: "Female", phoneNumber: 0912345678, universityName: "UVW University", gradeLevel: "Good", gpa: 9.3, bestRewardName: "Outstanding Student Award")
let goodStudent8 =  GoodStudent(fullName: "Liam Lee", doB: "02/02/1996", sex: "Male", phoneNumber: 0987654321, universityName: "RST College", gradeLevel: "Good", gpa: 8.8, bestRewardName: "Merit Scholarship")



let normalStudent1 =  NormalStudent(fullName: "Alice Johnson", doB: "03/03/1993", sex: "Female", phoneNumber: 0912345678, universityName: "DEF University", gradeLevel: "Normal", englishScore: 7.0, entryTestScore: 8.5)
let normalStudent2 =  NormalStudent(fullName: "Bob Williams", doB: "04/04/1996", sex: "Male", phoneNumber: 0356789123, universityName: "GHI College", gradeLevel: "Normal", englishScore: 6.5, entryTestScore: 7.0)
let normalStudent3 =  NormalStudent(fullName: "David Lee", doB: "07/07/1991", sex: "Male", phoneNumber: 0387654321, universityName: "RST University", gradeLevel: "Normal", englishScore: 7.2, entryTestScore: 8.0)
let normalStudent4 =  NormalStudent(fullName: "Sophia Taylor", doB: "08/08/1993", sex: "Female", phoneNumber: 0356789123, universityName: "UVW College", gradeLevel: "Normal", englishScore: 6.8, entryTestScore: 7.5)


let normalStudent5 =  NormalStudent(fullName: "Isabella Brown", doB: "11/11/1992", sex: "Female", phoneNumber: 0356789123, universityName: "LMN College", gradeLevel: "Normal", englishScore: 7.5, entryTestScore: 8.2)
let normalStudent6 =  NormalStudent(fullName: "Alexander Taylor", doB: "12/12/1994", sex: "Male", phoneNumber: 0987654321, universityName: "OPQ University", gradeLevel: "Normal", englishScore: 6.9, entryTestScore: 7.8)
let normalStudent7 =  NormalStudent(fullName: "Ava Johnson", doB: "03/03/1991", sex: "Female", phoneNumber: 0356789123, universityName: "GHI University", gradeLevel: "Normal", englishScore: 7.7, entryTestScore: 8.5)
let normalStudent8 =  NormalStudent(fullName: "Noah Williams", doB: "04/04/1994", sex: "Male", phoneNumber: 0387654321, universityName: "DEF College", gradeLevel: "Normal", englishScore: 6.6, entryTestScore: 7.2)



var manager = managerSelectStudent()
manager.addStudent(stu:goodStudent1)
manager.addStudent(stu:goodStudent2)
manager.addStudent(stu:goodStudent3)
manager.addStudent(stu:goodStudent4)
manager.addStudent(stu:goodStudent5)
manager.addStudent(stu:goodStudent6)
manager.addStudent(stu:goodStudent7)
manager.addStudent(stu:goodStudent8)

manager.addStudent(stu:normalStudent1)
manager.addStudent(stu:normalStudent2)
manager.addStudent(stu:normalStudent3)
manager.addStudent(stu:normalStudent4)
manager.addStudent(stu:normalStudent5)
manager.addStudent(stu:normalStudent6)
manager.addStudent(stu:normalStudent7)
manager.addStudent(stu:normalStudent8)


print(manager.listStudent.count)
print("\n \n")

manager.selectStudent(number: 10)


print("\n \n")
print("--  display  --")
manager.display()
