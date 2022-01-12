//
//  SkillSpritesModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 12.10.2021.
//

import Foundation

struct CoordsImages: Codable {
    var x: Int
    var y: Int
    var w: Int
    var h: Int
}

struct SkillSprites : Codable {
    let normalActive : [SpritesData]?
    let notableActive : [SpritesData]?
    let keystoneActive : [SpritesData]?
    let normalInactive : [SpritesData]?
    let notableInactive : [SpritesData]?
    let keystoneInactive : [SpritesData]?
    let masteryActiveEffect: [SpritesData]?
    let masteryInactive: [SpritesData]?
    let masteryActiveSelected: [SpritesData]?
    let masteryConnected: [SpritesData]?

    enum CodingKeys: String, CodingKey {

        case normalActive = "normalActive"
        case notableActive = "notableActive"
        case keystoneActive = "keystoneActive"
        case normalInactive = "normalInactive"
        case notableInactive = "notableInactive"
        case keystoneInactive = "keystoneInactive"
        case masteryActiveEffect = "masteryActiveEffect"
        case masteryInactive = "masteryInactive"
        case masteryActiveSelected = "masteryActiveSelected"
        case masteryConnected = "masteryConnected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        normalActive = try values.decodeIfPresent([SpritesData].self, forKey: .normalActive)
        notableActive = try values.decodeIfPresent([SpritesData].self, forKey: .notableActive)
        keystoneActive = try values.decodeIfPresent([SpritesData].self, forKey: .keystoneActive)
        normalInactive = try values.decodeIfPresent([SpritesData].self, forKey: .normalInactive)
        notableInactive = try values.decodeIfPresent([SpritesData].self, forKey: .notableInactive)
        keystoneInactive = try values.decodeIfPresent([SpritesData].self, forKey: .keystoneInactive)
        masteryActiveEffect = try values.decodeIfPresent([SpritesData].self, forKey: .masteryActiveEffect)
        masteryInactive = try values.decodeIfPresent([SpritesData].self, forKey: .masteryInactive)
        masteryActiveSelected = try values.decodeIfPresent([SpritesData].self, forKey: .masteryActiveSelected)
        masteryConnected = try values.decodeIfPresent([SpritesData].self, forKey: .masteryConnected)
        
    }
}

struct SpritesData : Codable {
    let filename : String?
    let coords : [String: CoordsImages]?

    enum CodingKeys: String, CodingKey {
        case filename = "filename"
        case coords = "coords"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        filename = try values.decodeIfPresent(String.self, forKey: .filename)
        coords = try values.decodeIfPresent([String: CoordsImages].self, forKey: .coords) ?? nil
    }
}
