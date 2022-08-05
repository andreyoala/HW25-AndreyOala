//
//  CardModel.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import Foundation

struct Card: Decodable {
    private let name: String?
    private let manaCost: String?
    private let type: String?
    private let rarity: String?
    private let setName: String?
    private let artist: String?
    private let power: String?
    private let legalities: [LegalityElement]?
    private let imageURL: String?
    private let description: String?
    
    enum CodingKeys: String, CodingKey {
        case name, manaCost, type, rarity, setName, artist, power, legalities
        case imageURL = "imageUrl"
        case description = "text"
    }
    
    struct LegalityElement: Decodable {
        let format: String
        let legality: String
    }
    
}
extension Card: DisplayableProtocol {
    var manaCostLabelText: String {
        guard let manaCost = manaCost else {
            return "Card has no mana cost"
        }
        return String("Manacost - \(manaCost)")
    }
    
    var typeLabelText: String {
        guard let type = type else {
            return "Card has no type"
        }
        return String("Type - \(type)")
    }
    
    var rarityLabelText: String {
        guard let rarity = rarity else {
            return "Card has no rarity"
        }
        return String("Rarity - \(rarity)")
    }
    
    var setNameLabelText: String {
        guard let setName = setName else {
            return "Card has no set name"
        }
        return String("Set name - \(setName)")
    }
    
    var artistLabelText: String {
        guard let artist = artist else {
            return "Card has no artist"
        }
        return String("Artist - \(artist)")
    }
    
    var powerLabelText: String {
        guard let power = power else {
            return "Card has no power"
        }
        return String("Power - \(power)")
    }
    
    
    var descriptionLabelText: String {
        guard let description = description else {
            return "Description - Card has no description"
        }
        return description
    }
    
    var legalitiesLabelText: String {
        guard let legalities = legalities else {
            return "Legalities - Card has no legalities"
        }
        var response = "Legalities:\n"
        for (index, item) in legalities.enumerated() {
            response += " \(index + 1)) Format: \(item.format). Legality - \(item.legality)\n"
        }
        return response
    }
    
    var nameLabelText: String {
        guard let name = name else {
            return "Name - Card has no name"
        }
        return name
    }
    
    
}
