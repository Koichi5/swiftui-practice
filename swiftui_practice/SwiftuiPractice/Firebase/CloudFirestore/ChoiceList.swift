import Foundation

enum FavoriteMeal: String {
    case japanese, weastern, chinese, italian
    static let items: [FavoriteMeal] = [.japanese, .weastern, .chinese, .italian]
}

enum FavoriteSports: String {
    case baseball, soccer, tennis
    static let items: [FavoriteSports] = [.baseball, .soccer, .tennis]
}

enum YourPet: String {
    case dog, cat
    static let items: [YourPet] = [.dog, .cat]
}
