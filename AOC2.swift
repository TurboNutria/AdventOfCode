import Foundation

var filePath = Bundle.main.path(forResource: "input", ofType: "txt")
var data     = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
var text = (String(data:data!, encoding: .utf8)!)
var totalScore = 0
var secondScore = 0

enum player1Keys: Int, CaseIterable {
    case A = 0
    case B = 1
    case C = 2
    
    static func withLabel(_ label: String) -> player1Keys? {
          return self.allCases.first{ "\($0)" == label }
      }
}

enum player2Keys: Int, CaseIterable {
    case X = 0
    case Y = 1
    case Z = 2
    
    static func withLabel(_ label: String) -> player2Keys? {
        return self.allCases.first{ "\($0)" == label }
    }}

let chunks: [[String]] = text
    .components(separatedBy: .newlines)
    .map {
        $0.components(separatedBy: .whitespaces)
    }

func game(_ player1: Int, _ player2: Int) -> Int {
    if player1 == player2 {
        return 3
    }
    if (player1 + 1) % 3 == player2 {
        
        return 6
    }
    return 0
}

func decodeSecondRound(_ player1: Int, _ player2: Int) -> Int {
    if player2 == 0 {
    
        return (player1 - 1) % 3
    }
    
    if player2 == 1 {
        
        return player1
    }
    
    return (player1 + 1) % 3
}

for i in chunks {
    
    if let player1Game = player1Keys.withLabel(i.first!)?.rawValue,
       let player2Game = player2Keys.withLabel(i.last!)?.rawValue {
        
        totalScore += (player2Game + 1) + game(player1Game, player2Game)
        let player2choice = decodeSecondRound(player1Game, player2Game)
        secondScore += (player2choice +1) + game(player1Game, player2choice)
    }
}

print(totalScore)
print(secondScore)

