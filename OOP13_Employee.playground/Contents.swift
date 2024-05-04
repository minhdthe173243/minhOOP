import UIKit

class Test {
    func testBirthDay(birth: String)-> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let date = dateFormatter.date(from: birth){
            return date
        } else {
            return dateFormatter.date(from: "11/11/1111")!
        }
    }
    
    func testEmail(email: String)-> String {
        var individual = "^[\\w-\\.]+@(gmail+\\.)+com$"
        var group = "^[\\w-\\.]+@([\\w]{2,4}\\.)+edu+\\.+vn$"
        
        var result1 = email.range(of: individual, options: .regularExpression)
        var result2 = email.range(of: group, options: .regularExpression)
        
        if result1 != nil || result2 != nil {
            return email
        } else {
            return "email Error"
        }
    }
    
    
    func testPhone(number: String)-> Int {
        var regexnumber = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}"#
        var phone = number.range(of: regexnumber, options: .regularExpression)
        if phone != nil {
            return Int(number)!
        } else {
            return 0
        }
    }
    
    func testName(name: String) -> String {
        var regexname =  #"^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"#
        var username = name.range(of: regexname, options: .regularExpression)
        
        if username != nil {
            return name
        } else {
            return "name Error"
        }
    }
}

class Certificate: Test {
    var certificatedID: Int
    var certificateName: String
    var certificateRank: Int
    var certificatedDate: Date
    
    init(certificatedID: Int, certificateName: String, certificateRank: Int, certificatedDate: String) {
        self.certificatedID = certificatedID
        self.certificateName = certificateName
        self.certificateRank = certificateRank
        
        let test = Test()
        self.certificatedDate = test.testBirthDay(birth: certificatedDate)
    }
    
    
    
}





class Employee: Test {
    // count: use when add 1 employee will increase
    static var count = 0
    
    var id: String
    var name: String
    var birthDay: Date
    var phone: Int
    var email: String
    var employeeType: String
    var employeeCount: Int
    var certificates: [Certificate]
    
    
    init(id: String, name: String, birthDay: String, phone: Int, email: String, employeeType: Int, employeeCount: Int, certificates: [Certificate]) {
        
        Employee.count += 1
        self.id = id
        
        var test = Test()
        var nameInput = test.testName(name: name)
        self.name = nameInput
        
        self.birthDay = test.testBirthDay(birth: birthDay)
        
        var phoneInput = test.testPhone(number: String(phone))
        self.phone = phoneInput
        
        var emailInput = test.testEmail(email: email)
        self.email = emailInput
        
        if employeeType == 0 {
            self.employeeType = "Experience"
        } else if employeeType == 1 {
            self.employeeType = "Fresher"
        } else if employeeType == 2 {
            self.employeeType = "Intern"
        } else {
            self.employeeType = "Unknown"
        }
        
        self.employeeCount = Employee.count
        self.certificates = certificates
    }
    
    
    func showInfor() {
        print("ID: \(id)")
        print("Full Name: \(name)")
        print("Birth Day: \(birthDay)")
        print("Phone: \(phone)")
        print("Email: \(email)")
        print("Employee Type: \(employeeType)")
        print("Employee Count: \(employeeCount)")
        print("Certificates:")
        for certificate in certificates {
            print("\(certificate.certificatedID): \(certificate.certificateName), Rank: \(certificate.certificateRank), Date: \(certificate.certificatedDate)")
        }
    }
}


class Experience: Employee {
    var ExpInYear: Int
    var ProSkill: String
    
    init(id: String, name: String, birthDay: String, phone: Int, email: String, employeeType: Int, employeeCount: Int, ExpInYear: Int, ProSkill: String, certificates: [Certificate]) {
        self.ExpInYear =  ExpInYear
        self.ProSkill = ProSkill
        super.init(id: id, name: name, birthDay: birthDay, phone: phone, email: email, employeeType: employeeType, employeeCount: employeeCount, certificates: certificates)
    }
    
    override func showInfor() {
        super.showInfor()
        print("ExpInYear: \(ExpInYear)")
        print("ProSkill: \(ProSkill)")
        print("\n")
    }
}



class Fresher: Employee {
    var graduationDate : Date?
    var graduationRank: String
    var education: String
    
    
    
    init(id: String, name: String, birthDay: String, phone: Int, email: String, employeeType: Int, employeeCount: Int, graduationDate: String, graduationRank: String, education: String, certificates: [Certificate]) {
        var test = Test()
        self.graduationDate = test.testBirthDay(birth: graduationDate)
        self.graduationRank = graduationRank
        self.education = education
        
        super.init(id: id, name: name, birthDay: birthDay, phone: phone, email: email, employeeType: employeeType, employeeCount: employeeCount, certificates: certificates)
    }
    
    override func showInfor() {
        super.showInfor()
        print("graduationDate: \(String(describing: graduationDate))")
        print("graduationRank: \(graduationRank)")
        print("education: \(education)")
        print("\n")
    }
}



class Intern: Employee {
    var majors: String
    var semeter: Int
    var universityName: String
    
    
    init(id: String, name: String, birthDay: String, phone: Int, email: String, employeeType: Int, employeeCount: Int, majors: String, semeter: Int, universityName: String, certificates: [Certificate]) {
        self.majors =  majors
        self.semeter = semeter
        self.universityName = universityName
        
        super.init(id: id, name: name, birthDay: birthDay, phone: phone, email: email, employeeType: employeeType, employeeCount: employeeCount, certificates: certificates)
        
    }
    
    override func showInfor() {
        super.showInfor()
        print("majors: \(majors)")
        print("semeter: \(semeter)")
        print("universityName: \(universityName)")
        print("\n")
    }
}


class Manager {
    var listEmployee: [Employee] = []
    
    
    func printList(list: [Employee]) {
        for employee in list {
            if let obj = employee as? Experience {
                obj.showInfor()
            }
            else if let  obj = employee as? Fresher {
                obj.showInfor()
            }
            else if let  obj = employee as? Intern {
                obj.showInfor()
            }
        }
    }
    
    func display() {
        printList(list: listEmployee)
    }
    
    func addEmployee(obj: Employee) {
        listEmployee.append(obj)
    }
    
    
    
    func deleteEmoloyee(id: String) {
        let list = listEmployee.filter { sub in
            return sub.id != id
        }
        if list.count == listEmployee.count {
            print("id not exist")
        } else {
            printList(list: list)
        }
        
    }
    
    
    func updateEmployee(id: String, type: String, newValue: Any) {
        var count = 0
        for obj in listEmployee {
            if obj.id == id {
                count = 1
                switch type {
                   
                case "id":
                    obj.id = "\(newValue)"
                    break
                case "name":
                    obj.name = "\(newValue)"
                    break
                case "birthDay":
                    let test = Test()
                    obj.birthDay = test.testBirthDay(birth: "\(newValue)")
                    break
                case "phone":
                    obj.phone = Int("\(newValue)") ?? 0
                    break
                case "email":
                    let test = Test()
                    obj.email = test.testEmail(email:  "\(newValue)")
                    break
                case "employeeType":
                    obj.employeeType = "\(newValue)"
                    break
                case "employeeCount":
                    obj.employeeCount = Int("\(newValue)") ?? 0
                    break
               case "expInYear":
                    if let experience = obj as? Experience {
                        experience.ExpInYear = Int("\(newValue)") ?? 0
                    }
                    break
                case "proSkill":
                    if let experience = obj as? Experience {
                        experience.ProSkill = "\(newValue)"
                    }
                    
                    break
                case "graduationDate":
                    if let experience = obj as? Fresher {
                        var test = Test()
                        experience.graduationDate = test.testBirthDay(birth: "\(newValue)")
                        
                    }
                    break
                case "graduationRank":
                    if let experience = obj as? Fresher {
                        experience.graduationRank = "\(newValue)"
                    }
                    break
                case "education":
                    if let experience = obj as? Fresher {
                        experience.education = "\(newValue)"
                    }
                    break
                    
                case "majors":
                    if let experience = obj as? Intern {
                        experience.majors = "\(newValue)"
                    }
                    break
                case "semester":
                    if let experience = obj as? Intern {
                        experience.semeter = Int("\(newValue)") ?? 0
                    }
                    break
                case "universityName":
                    if let experience = obj as? Intern {
                        experience.universityName = "\(newValue)"
                    }
                    break
                    
                default:
                   return
                    
                }
            }
            
            
        }
        if (count == 0) {
            print("employee does not exist")
        }
        
    }
    
    func searchIntern() {
        var list = listEmployee.filter { $0 is Intern
        }
        printList(list: list)
    }
    
    func searchExperience() {
        var list = listEmployee.filter { $0 is Experience
        }
        printList(list: list)
    }
    
    func searchFresher() {
        var list = listEmployee.filter { $0 is Fresher
        }
        printList(list: list)
    }
    
}



let certificate1 = Certificate(certificatedID: 1, certificateName: "Certificate 1", certificateRank: 1, certificatedDate: "01/01/2022")
let employee1 = Experience(id: "001", name: "John Doe", birthDay: "01/00/1990", phone: 1234567890, email: "john.doe@gmail.com", employeeType: 0, employeeCount: 0, ExpInYear: 5, ProSkill: "Swift", certificates: [certificate1])


let certificate2 = Certificate(certificatedID: 2, certificateName: "Certificate 2", certificateRank: 2, certificatedDate: "01/01/2023")
let employee2 = Intern(id: "002", name: "Alice Smith", birthDay: "01/01/1995", phone: 9876543210, email: "alice.smith@edu.vn", employeeType: 2, employeeCount: 0, majors: "Computer Science", semeter: 3, universityName: "ABC University", certificates: [certificate2])


let certificate3 = Certificate(certificatedID: 3, certificateName: "Certificate 3", certificateRank: 3, certificatedDate: "01/01/2024")
let employee3 = Fresher(id: "003", name: "Emily Johnson", birthDay: "01/01/1997", phone: 1234567890, email: "emily.johnson@edu.vn", employeeType: 1, employeeCount: 0, graduationDate: "01/01/2021", graduationRank: "Excellent", education: "Computer Science", certificates: [certificate3])


let certificate4 = Certificate(certificatedID: 4, certificateName: "Certificate 4", certificateRank: 4, certificatedDate: "01/01/2025")
let employee4 = Experience(id: "004", name: "Michael Brown", birthDay: "01/01/1985", phone: 9876543210, email: "michael.brown@gmail.com", employeeType: 0, employeeCount: 0, ExpInYear: 10, ProSkill: "Java", certificates: [certificate4])


var manager = Manager()
manager.addEmployee(obj: employee1)
manager.addEmployee(obj: employee2)
manager.addEmployee(obj: employee3)
manager.addEmployee(obj: employee4)


print("-- display --")
manager.display()


print("\n\n")
print("-- delete Employee --")
manager.deleteEmoloyee(id: "00")


print("\n\n")
print("-- List Experience Employee --")
manager.searchExperience()


print("\n\n")
print("-- List Intern Employee --")
manager.searchIntern()


print("\n\n")
print("-- List Fresher Employee --")
manager.searchFresher()


print("\n\n")
print("-- Update Employee --")
manager.updateEmployee(id: "004", type: "expInYear", newValue: "9")
manager.display()
