import UIKit

class Verhicle {
    var id: String
    var manufacture: String
    var yearOfManufacture: Int
    var price: Double
    var color: String
    
    
    init(id: String, manufacture: String, yearOfManufacture: Int, price: Double, color: String) {
        self.id = id
        self.manufacture = manufacture
        self.yearOfManufacture = yearOfManufacture
        self.price = price
        self.color = color
    }
}


class Car: Verhicle {
    var numberOfSite: Int
    var engineType: String
    
    init(id: String, manufacture: String, yearOfManufacture: Int, price: Double, color: String, numberOfSite: Int, engineType: String) {
        self.numberOfSite = numberOfSite
        self.engineType = engineType
        
        super.init(id: id, manufacture: manufacture, yearOfManufacture: yearOfManufacture, price: price, color: color)
    }
}


class Motobike: Verhicle {
    var wattage: Double
    init(id: String, manufacture: String, yearOfManufacture: Int, price: Double, color: String, wattage: Double) {
        self.wattage = wattage
        
        super.init(id: id, manufacture: manufacture, yearOfManufacture: yearOfManufacture, price: price, color: color)
    }
}

class Truck: Verhicle {
    var tonnage: Double
    init(id: String, manufacture: String, yearOfManufacture: Int, price: Double, color: String, tonnage: Double) {
        self.tonnage = tonnage
        
        super.init(id: id, manufacture: manufacture, yearOfManufacture: yearOfManufacture, price: price, color: color)
    }
}



class Manager {
    var list: [Verhicle] = []
    
    func addVerhicle(obj: Verhicle){
        for ver in list {
            if obj.id == ver.id {
                print("id already exist")
                return
            }
        }
        list.append(obj)
    }
    
    func printVerhicle(obj: [Verhicle]) {
        for ver in obj {
            if let car = ver as? Car {
                print("id: \(car.id), manufacture: \(car.manufacture), yearOfManufacture: \(car.yearOfManufacture), price: \(car.price), color: \(car.color),numberOfSite: \(car.numberOfSite), engineType:\(car.engineType) ")
            }
            else if let motobike = ver as? Motobike {
                print("id: \(motobike.id), manufacture: \(motobike.manufacture), yearOfManufacture: \(motobike.yearOfManufacture), price: \(motobike.price), color: \(motobike.color),wattage: \(motobike.wattage) ")
            }
            else if let truck = ver as? Truck {
                print("id: \(truck.id), manufacture: \(truck.manufacture), yearOfManufacture: \(truck.yearOfManufacture), price: \(truck.price), color: \(truck.color),tonnage: \(truck.tonnage) ")
            }
        }
    }
    
    func deleteVerhicleById(id: String){
        let listDeleteId = list.filter { ver in
            return ver.id != id
        }
        printVerhicle(obj: listDeleteId)
    }
    
    
    func searchByManufactureAndColor(manufacture: String, color: String) {
        let listSearch = list.filter { ver in
            return ver.manufacture == manufacture && ver.color == color
        }
        if(listSearch.isEmpty) {
            print("not found verhicle by manufacture and color ")
        } else {
            printVerhicle(obj: listSearch)
        }
    }
}



let manager = Manager()

let car1 = Car(id: "OTO001", manufacture: "Toyota", yearOfManufacture: 2020, price: 50000, color: "Đen", numberOfSite: 5, engineType: "Xăng")

let moto1 = Motobike(id: "XEMAY001", manufacture: "Honda", yearOfManufacture: 2019, price: 20000, color: "Trắng", wattage: 150)

let truck1 = Truck(id: "XETAI001", manufacture: "Hyundai", yearOfManufacture: 2018, price: 70000, color: "Xanh", tonnage: 1000)



manager.addVerhicle(obj: car1)
manager.addVerhicle(obj: moto1)
manager.addVerhicle(obj: truck1)
manager.addVerhicle(obj: truck1)

print("---- delete ----")
manager.deleteVerhicleById(id:"XEMAY001" )

print("\n")
print("---- search ----")
manager.searchByManufactureAndColor(manufacture: "Toyota", color: "Đen")
