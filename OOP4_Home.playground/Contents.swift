import UIKit


class Person {
    private var fullName: String
    var age: Int
    var job: String
    private var identityCardNumber : Int
    
    init(name:String, age: Int ,job: String, identityCard: Int){
        self.fullName = name
        self.age = age
        self.job = job
        self.identityCardNumber = identityCard
    }
    
    var name: String {
        get {
            return self.fullName
        }
    }
    
    var identityCard: Int {
        get {
            return self.identityCardNumber
        }
    }
}


class Family {
    var numberOfMember: Int
    private var infor:[Person]
    var address: String
    
    init(numberOfMember: Int , address: String,infor:[Person]){
        self.numberOfMember = numberOfMember
        self.address = address
        self.infor = infor
    }
    
    var getIntfor: [Person]{
        get {
            return self.infor
        }
    }
}


class Town {
    var homeList:[Family] = []
    
    func display() {
        for family in homeList {
            print("address: \(family.address), number: \(family.numberOfMember)")
            print("List number of member each home:")
            for person in family.getIntfor {
                print("Name: \(person.name), Age: \(person.age), Job : \(person.job), Id: \(person.identityCard)")
            }
            print("\n \n \n")
        }
    }
    
    func addHome(home: Family) {
        homeList.append(home)
    }
}




var town = Town()

let home1 = Family(numberOfMember: 3, address: "123", infor: [
    Person(name: "Nguyen Van A", age: 35, job: "Kỹ sư", identityCard: 123456789),
    Person(name: "Nguyen Thi B", age: 30, job: "Giáo viên", identityCard: 987654321),
    Person(name: "Nguyen Van C", age: 5, job: "Học sinh", identityCard: 135792468)
])

let home2 = Family(numberOfMember: 2, address: "456", infor: [
    Person(name: "Tran Van D", age: 40, job: "Bác sĩ", identityCard: 456123789),
    Person(name: "Tran Thi E", age: 35, job: "Y tá", identityCard: 789321654)
])

let home3 = Family(numberOfMember: 4, address: "789", infor: [
    Person(name: "Le Van F", age: 28, job: "Nhân viên văn phòng", identityCard: 147258369),
    Person(name: "Le Thi G", age: 25, job: "Kế toán", identityCard: 369258147),
    Person(name: "Le Van H", age: 8, job: "Học sinh", identityCard: 258147369),
    Person(name: "Le Thi I", age: 60, job: "Nội trợ", identityCard: 951357456)
])

town.addHome(home: home1)
town.addHome(home: home2)
town.addHome(home: home3)

town.display()



