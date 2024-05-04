import UIKit

class Student {
     var name: String
     var age: Int
     var room: String
    
    init(name: String, age: Int, room: String) {
        self.name = name
        self.age = age
        self.room = room
    }
}


class Card {
    private var idCard: String
    var borrowDate: Date
    var returnDate: Date
    var bookStoreNumber: String
    var student:[Student]
    
    init(id: String, borrowDate: String, returnDate: String, bookStoreNumber: String, student: [Student]) {
        
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        
        self.idCard = id
        
        if let date1 = format.date(from: borrowDate) {
            self.borrowDate = date1
        } else {
            self.borrowDate = format.date(from: "01-01-1111")!
        }
        
        if let date2 = format.date(from: returnDate) {
            self.returnDate = date2
        } else {
            self.returnDate = format.date(from: "01-01-1111")!
        }
        
        self.bookStoreNumber = bookStoreNumber
        self.student = student
    }
    
    var id: String {
        get {
            return self.idCard
        }
    }
}


class Manager {
    var list:[Card] = []
   
    func printCard(obj: [Card]) {
        var count = 0
        for card in obj {
            count += 1
            print("--- Card \(count) ---")
            print("id: \(card.id), borrowDate: \(card.borrowDate), returnDate:\(card.returnDate), bookstoreNumber: \(card.bookStoreNumber)")
            print("---- Student ----")
            for stu in card.student {
                print("name: \(stu.name), age: \(stu.age), room: \(stu.room)")
            }
        }
    }
    
    func addCard(obj: Card) {
        list.append(obj)
    }
    
    
    func delete(id: String) {
        let listDelete = list.filter { card in
            return card.id != id
        }
        printCard(obj: listDelete)
    }
    
    func display(){
        printCard(obj: list)
    }
}


let manager = Manager()

var student1: Student = Student(name: "Nguyen Van A", age: 20, room: "K42")
var student2: Student = Student(name: "Tran Thi B", age: 22, room: "K43")
var student3: Student = Student(name: "Pham Van C", age: 21, room: "K44")
var student4: Student = Student( name: "Nguyen Thi E", age: 20, room: "K46")
var student5: Student = Student(name: "Tran Van F", age: 22, room: "K47")
var student6: Student = Student(name: "Pham Van G", age: 21, room: "K48")
var student7: Student = Student(name: "Le Thi D", age: 19, room: "K45")


let card1 = Card(id: "PM001", borrowDate: "10-7-2010", returnDate: "20-7-2010", bookStoreNumber: "SH001", student: [student1, student2])

let card2 = Card(id: "PM005", borrowDate: "02-8-2010", returnDate: "11-9-2010", bookStoreNumber: "SH005", student: [student3] )

let card3 = Card(id: "PM006", borrowDate: "05-03-2010", returnDate: "10-7-2010", bookStoreNumber: "SH006", student: [student4, student5, student6, student7] )


manager.addCard(obj: card1)
manager.addCard(obj: card2)
manager.addCard(obj: card3)

print("---- Delete By Id ----")
manager.delete(id: "PM005")

print("\n \n \n" )
print("---- Display ----")
manager.display()








