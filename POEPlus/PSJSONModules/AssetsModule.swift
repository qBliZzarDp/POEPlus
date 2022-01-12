//
//  AssetsModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import Foundation

/// Структура, соджащая в себе значения фрейма изображений
struct AssetsFrame : Codable {
    ///value = "0.1246"
    let small: String?
    ///value = "0.2109"
    let preSmall: String?
    ///value = "0.2972"
    let middle: String?
    ///value = "0.3835"
    let big: String?
    ///value = "1"
    let one: String?

    enum CodingKeys: String, CodingKey {

        case small = "0.1246"
        case preSmall = "0.2109"
        case middle = "0.2972"
        case big = "0.3835"
        case one = "1"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        small = try values.decodeIfPresent(String.self, forKey: .small)
        preSmall = try values.decodeIfPresent(String.self, forKey: .preSmall)
        middle = try values.decodeIfPresent(String.self, forKey: .middle)
        big = try values.decodeIfPresent(String.self, forKey: .big)
        one = try values.decodeIfPresent(String.self, forKey: .one)
    }

}
