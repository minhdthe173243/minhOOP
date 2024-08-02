import UIKit
//1233
class Word {
    var word: String
    
    init(word: String) {
        self.word = word
    }
    
    func countWord(){
        let filterChar = word.filter { !$0.isWhitespace }
        print("count: \(String(filterChar).count)")
    }
        
    
    func countOccurrences(of character: Character) -> Int {
          let lowercasedWord = word.lowercased()
        return lowercasedWord.filter { $0 == character}.count
      }
    
    func formatWord() {
        var charWord = word.trimmingCharacters(in: .whitespaces)
        var char = charWord.split(separator: " ")
        var paragraph = char.joined(separator: " ")
        print(paragraph)
     
    }
    
    
}



var word = Word(word: "       AA            sa   lsa   llojo a   ")
word.countWord()
print("\(word.countOccurrences(of: "a"))")
word.formatWord()







