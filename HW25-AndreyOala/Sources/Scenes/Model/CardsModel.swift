//
//  CardsModel.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import Foundation

struct Cards: Decodable {
    let all: [Card]
    
    enum CodingKeys: String, CodingKey {
        case all = "cards"
    }
}
