import UIKit

//parent class
class Library {
    var id: String
    var publishingCompany: String
    var releaseNumber: Int
    
    init(id: String, publishingCompany: String, releaseNumber:Int){
        self.id = id
        self.publishingCompany = publishingCompany
        self.releaseNumber = releaseNumber
    }
}

//subclass
class Book: Library {
    var  athorName: String
    var pagenumber: Int
    
    init(id: String, publishingCompany: String, releaseNumber:Int, athorName: String, pagenumber: Int){
        self.athorName = athorName
        self.pagenumber = pagenumber
        super.init(id: id, publishingCompany: publishingCompany, releaseNumber: releaseNumber)
    }
}

class Manazine: Library {
    var issueNumber: Int
    var issueMonth: Int
    
    init(id: String, publishingCompany: String, releaseNumber:Int,issueNumber: Int, issueMonth: Int){
        self.issueNumber = issueNumber
        self.issueMonth = issueMonth
        super.init(id: id, publishingCompany: publishingCompany, releaseNumber: releaseNumber)
    }
}


class News: Library {
    var releaseDate:  Date
    init(id: String, publishingCompany: String, releaseNumber:Int,releaseDate: String){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        
        if let date = dateFormater.date(from: releaseDate) {
            self.releaseDate = date
        } else {
            self.releaseDate = Date()
            print("Failed to input date")
        }
        
        super.init(id: id, publishingCompany: publishingCompany, releaseNumber: releaseNumber)
    }
}


class ManagerLibrary {
    var listLibrary:[Library] = []
    
    func printList(list: [Library]) {
        for file in list {
            if let book = file as? Book {
                print("Book: id:\(book.id), publishingCompany:\(book.publishingCompany),releaseNumber:\(book.releaseNumber), athorName:\(book.athorName),pagenumber:\(book.pagenumber) ")
            }
            else if let manazine = file as? Manazine {
                print("Manazine: id:\(manazine.id), publishingCompany:\(manazine.publishingCompany), releaseNumber: \(manazine.releaseNumber), issueNumber:\(manazine.issueNumber), issueMonth:\(manazine.issueMonth) ")
            }
            else if let news = file as? News {
                print("News: id:\(news.id),  publishingCompany:\(news.publishingCompany), releaseNumber:\(news.releaseNumber), releaseDate:\(news.releaseDate)")
            }
        }
    }
    
    // add 1 object into list
    func addDocument(obj: Library) {
        listLibrary.append(obj)
    }
    
    // delete 1 object from the list by id
    func deleteById(id: String) {
        var list = listLibrary.filter { obj in
            return obj.id != id
        }
        printList(list: list)
    }
    
    // display all object in the list
    func display() {
        printList(list: listLibrary)
    }
    
    // search and displays object types by category
    func searchByType(type: String) {
        for file in listLibrary {
            switch type {
            case "Book":
                if let book = file as? Book {
                    print("Book: id:\(book.id), publishingCompany:\(book.publishingCompany), releaseNumber:\(book.releaseNumber), athorName:\(book.athorName),pagenumber:\(book.pagenumber) ")
                }
                break
            case "Manazine":
                if let manazine = file as? Manazine {
                    print("Manazine: id:\(manazine.id), publishingCompany:\(manazine.publishingCompany),releaseNumber:\(manazine.releaseNumber),   issueNumber:\(manazine.issueNumber), issueMonth:\(manazine.issueMonth) ")
                }
                break
            case "News":
                if let news = file as? News {
                    print("News: id:\(news.id),publishingCompany:\(news.publishingCompany),releaseNumber:\(news.releaseNumber), releaseDate:\(news.releaseDate)")
                }
                break
            default:
                return
            }
        }
    }
}



let  manager = ManagerLibrary()

let book = Book(id: "B001", publishingCompany: "NXB A", releaseNumber: 100, athorName: "Tác giả A", pagenumber: 200)
let manazine = Manazine(id: "M001", publishingCompany: "NXB B", releaseNumber: 50, issueNumber: 1, issueMonth: 4)
let news = News(id: "N001", publishingCompany: "NXB C", releaseNumber: 200, releaseDate:"20-04-2024")

manager.addDocument(obj: book)
manager.addDocument(obj: manazine)
manager.addDocument(obj: news)

print("--delete--")
manager.deleteById(id: "B001")

print("\n")

print("--printList--")
manager.display()

print("\n")

print("--searchList--")
manager.searchByType(type: "Book")
