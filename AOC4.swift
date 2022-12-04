import Foundation


var filePath = Bundle.main.path(forResource: "input 2", ofType: "txt")
var data     = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
var text = (String(data:data!, encoding: .utf8)!)
var repeated = 0
var intersected = 0
var chunks: [[[String]]] = text
    .components(separatedBy: .newlines)
    .dropLast()
    .map { $0.components(separatedBy: ",").map {$0.components(separatedBy: "-")} }

var numChuns  = chunks.map {
    var expandedList =
    ($0.map {
    Array((Int($0.first ?? "0")!)...(Int($0.last ?? "0")!))
    })
    var firstElement = expandedList.first!
    var secondElement = expandedList.last!
    if firstElement.contains(secondElement) {
        
        repeated += 1
    } else if secondElement.contains(firstElement) {
        
        repeated += 1
    } 
    if (Set(firstElement).intersection(Set(secondElement)).count) > 0 {
        
        intersected += 1
    }
}

print(repeated)
print(intersected)
