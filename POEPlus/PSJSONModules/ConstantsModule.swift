//
//  ConstantsModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 12.10.2021.
//

import Foundation

struct Constants: Codable {
    let classes : ClassesConstants?
    let characterAttributes : CharacterAttributes?
    let pSSCentreInnerRadius : Int?
    let skillsPerOrbit : [Int]?
    let orbitRadii : [Int]?

    enum CodingKeys: String, CodingKey {

        case classes = "classes"
        case characterAttributes = "characterAttributes"
        case pSSCentreInnerRadius = "PSSCentreInnerRadius"
        case skillsPerOrbit = "skillsPerOrbit"
        case orbitRadii = "orbitRadii"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        classes = try values.decodeIfPresent(ClassesConstants.self, forKey: .classes)
        characterAttributes = try values.decodeIfPresent(CharacterAttributes.self, forKey: .characterAttributes)
        pSSCentreInnerRadius = try values.decodeIfPresent(Int.self, forKey: .pSSCentreInnerRadius)
        skillsPerOrbit = try values.decodeIfPresent([Int].self, forKey: .skillsPerOrbit)
        orbitRadii = try values.decodeIfPresent([Int].self, forKey: .orbitRadii)
    }

}

struct CharacterAttributes: Codable {
    let strength : Int?
    let dexterity : Int?
    let intelligence : Int?

    enum CodingKeys: String, CodingKey {

        case strength = "Strength"
        case dexterity = "Dexterity"
        case intelligence = "Intelligence"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strength = try values.decodeIfPresent(Int.self, forKey: .strength)
        dexterity = try values.decodeIfPresent(Int.self, forKey: .dexterity)
        intelligence = try values.decodeIfPresent(Int.self, forKey: .intelligence)
    }

}

struct ClassesConstants: Codable {
    let strDexIntClass : Int?
    let strClass : Int?
    let dexClass : Int?
    let intClass : Int?
    let strDexClass : Int?
    let strIntClass : Int?
    let dexIntClass : Int?

    enum CodingKeys: String, CodingKey {

        case strDexIntClass = "StrDexIntClass"
        case strClass = "StrClass"
        case dexClass = "DexClass"
        case intClass = "IntClass"
        case strDexClass = "StrDexClass"
        case strIntClass = "StrIntClass"
        case dexIntClass = "DexIntClass"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strDexIntClass = try values.decodeIfPresent(Int.self, forKey: .strDexIntClass)
        strClass = try values.decodeIfPresent(Int.self, forKey: .strClass)
        dexClass = try values.decodeIfPresent(Int.self, forKey: .dexClass)
        intClass = try values.decodeIfPresent(Int.self, forKey: .intClass)
        strDexClass = try values.decodeIfPresent(Int.self, forKey: .strDexClass)
        strIntClass = try values.decodeIfPresent(Int.self, forKey: .strIntClass)
        dexIntClass = try values.decodeIfPresent(Int.self, forKey: .dexIntClass)
    }

}
