import Foundation

// JSON response from emojipet server
var emojiPetsJSON = """
[
    {
        "id": 1,
        "name": "FailPanda",
        "emoji": "🐼"
    },
    {
        "id": 2,
        "name": "CarrotNinja",
        "emoji": "🐰"
    }
]
"""

// Data Model
protocol EmojiPetProtocol {
    var name: String { get }
    var emoji: String { get }
}

final class EmojiPet: EmojiPetProtocol, Codable {
    let name: String // e.g., "FailPanda"
    let emoji: String // e.g., "🐼"
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}

// JSON Decoding
let decoder = JSONDecoder()
let pets = try! decoder.decode([EmojiPet].self, from: emojiPetsJSON.data(using: .utf8)!)

print("Welcome to our little decoded zoo!")
for pet in pets {
    print("\(pet.name) \(pet.emoji)")
}
