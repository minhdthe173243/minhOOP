import UIKit

class Client {
    var name: String
    var idAddress: String
    var meterCode: String
    
    init(name: String, idAddress: String, meterCode: String) {
        self.name = name
        self.idAddress = idAddress
        self.meterCode = meterCode
    }
}

class Bill: Client {
    var oldIndex: Int
    var newIndex: Int
    var amounToPay: Double
    
    init(name: String, idAddress: String, meterCode: String, oldIndex: Int, newIndex: Int) {
        self.oldIndex = oldIndex
        self.newIndex = newIndex
        self.amounToPay = 0
        super.init(name: name, idAddress: idAddress, meterCode: meterCode)
    }
    
    func countPay()-> Double {
        return Double((newIndex - oldIndex) * 5)
    }
    
}

class Manager {
    var list: [Bill] = []
    
    func addHouse(obj: Bill){
        list.append(obj)
    }
    
    func printList(obj: [Bill]) {
        for sub in obj {
            print("name: \(sub.name), idAddress: \(sub.idAddress), meterCode: \(sub.meterCode), oldIndex: \(sub.oldIndex) , newIndex: \(sub.newIndex), accountToPay: \(sub.countPay())")
        }
    }
    
    
    func delete(id: String) {
        var bill = list.filter { obj in
            return obj.idAddress != id
        }
        printList(obj: bill)
    }
    
    func update(id: String, type: String, newValue: Any) {
        for obj in list {
            if obj.idAddress == id {
                switch type {
                case "name":
                    obj.name = "\(newValue)"
                    break
                case "idAddress":
                    obj.idAddress = "\(id),  , idAddress not change"
                    break
                case "meterCode":
                    obj.meterCode = "\(newValue)"
                    break
                case "oldIndex":
                    obj.oldIndex  = Int("\(newValue)") ?? 0
                    break
                case "newIndex":
                    obj.newIndex  = Int("\(newValue)") ?? 0
                    break
                    
                default:
                    print("input error")
                }
            }
        }
    }
    

    func display() {
        printList(obj: list)
    }
    
}

let client1 = Bill(name: "Nguyễn Văn A", idAddress: "10A", meterCode: "CTD001", oldIndex: 100, newIndex: 150)

let client2 = Bill(name: "Trần Thị B", idAddress: "20B", meterCode: "CTD002", oldIndex: 200, newIndex: 250)

let client3 = Bill(name: "Lê Thị C", idAddress: "30C", meterCode: "CTD003", oldIndex: 300, newIndex: 350)

let client4 = Bill(name: "Phạm Văn D", idAddress: "40D", meterCode: "CTD004", oldIndex: 400, newIndex: 420)

let client5 = Bill(name: "Hoàng Thị E", idAddress: "50E", meterCode: "CTD005", oldIndex: 450, newIndex: 500)

let manager = Manager()

manager.addHouse(obj: client1)
manager.addHouse(obj: client2)
manager.addHouse(obj: client3)
manager.addHouse(obj: client4)
manager.addHouse(obj: client5)


print("---- print list ----")
manager.display()

print("\n")
print("--- delete list ----")
manager.delete(id: "10A")

print("\n")
print("---- update list ----")
manager.update(id: "50E", type: "oldIndex", newValue: 500)

manager.display()
