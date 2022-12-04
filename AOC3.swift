
import Foundation

var filePath = Bundle.main.path(forResource: "input", ofType: "txt")
var data     = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
var text = (String(data:data!, encoding: .utf8)!)
var repeated: [Int] = []
var badges: [Int] = []
let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var chunks: [String] = text
    .components(separatedBy: .newlines)
chunks.removeLast()
var noDuplicates = chunks.map {
    Set($0)
}
var chunkedChunks = noDuplicates.chunked(into: 3)
chunkedChunks.map {
    var counts: [Character: Int] = [:]
    for item in ($0.reduce("") {$0 + $1}) {
        counts[item] = (counts[item] ?? 0) + 1
    }
    for (key, value) in counts {
        if value == 3 {
            print(key)
            if let firstIndex = alphabet.firstIndex(of: key) {
                            
                            let index: Int = alphabet.distance(from: alphabet.startIndex, to: firstIndex)
                badges.append(index + 1)
                        }
        }
    }
}
for str in chunks {
    var copyStr = str
    let halfLength = str.count / 2
    let index = str.index(str.startIndex, offsetBy: halfLength)
    copyStr.insert("-", at: index)
        let result = copyStr.split(separator: "-")
        Set(result.first!).intersection(result.last!).map {
            if let firstIndex = alphabet.firstIndex(of: $0) {
                
                let index: Int = alphabet.distance(from: alphabet.startIndex, to: firstIndex)
                 repeated.append(index + 1)
            }
    }
    }

print(repeated.reduce(0,+))
print(badges.reduce(0,+))
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

