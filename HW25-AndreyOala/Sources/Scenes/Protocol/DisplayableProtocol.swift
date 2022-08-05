//
//  DisplayableProtocol.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import Foundation
protocol DisplayableProtocol {
    var nameLabelText: String { get }
    var manaCostLabelText: String { get }
    var typeLabelText: String { get }
    var rarityLabelText: String { get }
    var setNameLabelText: String { get }
    var artistLabelText: String { get }
    var powerLabelText: String { get }
    var descriptionLabelText: String { get }
    var legalitiesLabelText: String { get }
}
