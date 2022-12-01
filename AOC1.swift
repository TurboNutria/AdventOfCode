import Foundation

var filePath = Bundle.main.path(forResource: "input", ofType: "txt")
var data     = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
var text = (String(data:data!, encoding: .utf8)!)
var caloriesList: [Int] = []

let chunks: [ArraySlice] = text
    .components(separatedBy: .newlines)
    .reversed()
    .enumerated()
    .map { $0.element }
    .reversed()
    .split(separator: "")

for i in chunks {
    caloriesList.append(
        Array(i)
        .map {Int($0)!}
        .reduce(0, +)
        )
}

let caloriesSorted = caloriesList.sorted()
let topThree = caloriesList.sorted().suffix(3).reduce(0, +)
print("The elf with the most calories is: \(caloriesSorted.last ?? 0)")
print("The top three elves are carrying \(topThree)")
