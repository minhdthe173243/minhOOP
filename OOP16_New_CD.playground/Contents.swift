import UIKit


/*Viết chương trình xây dựng đối tượng CD gồm có các thuộc tính sau:
 
 Mã CD là số nguyên.
 Tựa CD: chuỗi ký tự.
 Ca sỹ: chuỗi ký tự.
 Số bài hát: số nguyên (>0).
 Giá thành : số thực (>0).
 Các thuộc tính khai báo private, định nghĩa các phương thức get/set cho từng thuộc tính.
 
 Viết các constructor để khởi tạo đối tượng CD.
 
 Override phương thức toString của lớp Object.
 
 Xây dựng lớp lưu danh sách các CD (dùng mảng).
 
 Phương thức thêm 1 CD vào danh sách, thêm thành công nếu không trùng mã CD và kích thước mảng còn cho phép.
 Tính số lượng CD có trong danh sách.
 Tình tổng giá thành của các CD.
 Phương thức sắp xếp danh sách giảm dần theo giá thành.
 Phương thức sắp xếp danh sách tăng dần theo tựa CD.
 Phương thức xuất toàn bộ danh sách
 Viết lớp cho phần kiểm nghiệm. Dùng menu case thực hiện các chức năng theo yêu cầu.
 */


class VideoCD {
    var id: Int
    var type: String
    var singer: String
    var numberSing: Int
    var price: Double
    
    init(id: Int, type: String, singer: String, numberSing: Int, price: Double) {
        self.id = id
        self.type = type
        self.singer = singer
        if(numberSing > 0) {
            self.numberSing = numberSing
        } else {
            self.numberSing = 0
        }
        
        if(price > 0) {
            self.price = price
        } else {
            self.price = 0
        }
    }
    
    func toString() {
        print("id: \(id), type: \(type), singer: \(singer), numberSing: \(numberSing), price: \(price)")
    }
}

class ManagerListCD {
    var listCD = [VideoCD]()
    
    func printList(list: [VideoCD]) {
        for CD in list {
            CD.toString()
        }
    }
    func addCD(CD: VideoCD) {
        if !listCD.contains(where: { $0.id == CD.id}) {
            listCD.append(CD)
        } else {
            print("not add because videoCD already exist")
        }
    }
    
    
    func countListVideoCD() {
        print("count: \(listCD.count)")
    }
    
    
    func countPriceVideoCD() {
        var count: Double = 0
        
        for price in listCD {
            count += price.price
        }
        print("count price videoCD: \(count)")
    }
    
    func sortReduceVideoCDByPrice() {
        var list = listCD.sorted { $0.price > $1.price   }
        printList(list: list)
    }
    
    func sortIncreaseVideoCDByType() {
        var list = listCD.sorted { $0.price < $1.price   }
        printList(list: list)
        
    }
    
    func display() {
        printList(list: listCD)
    }
}


var menu = ManagerListCD()

let cd1 = VideoCD(id: 1, type: "Tua CD 1", singer: "Ca sỹ 1", numberSing: 10, price: 9.5)
let cd2 = VideoCD(id: 2, type: "Tua CD 2", singer: "Ca sỹ 2", numberSing: 12, price: 14.9)
let cd3 = VideoCD(id: 3, type: "Tua CD 3", singer: "Ca sỹ 3", numberSing: 8, price: 11.7)
let cd4 = VideoCD(id: 4, type: "Tua CD 4", singer: "Ca sỹ 4", numberSing: 15, price: 19.9)


menu.addCD(CD: cd1)
menu.addCD(CD: cd2)
menu.addCD(CD: cd3)
menu.addCD(CD: cd4)

print("-- count video in list --")
menu.countListVideoCD()

print("\n\n")
print("-- all count price video in list --")
menu.countPriceVideoCD()

print("\n\n")
print("-- sort Reduce VideoCD By Price --")
menu.sortReduceVideoCDByPrice()

print("\n\n")
print("-- sort Increase VideoCD By Type --")
menu.sortIncreaseVideoCDByType()


print("\n\n")
print("-- display --")
menu.display()
