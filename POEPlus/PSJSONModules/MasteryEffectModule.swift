//
//  MasteryEffectModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 19.10.2021.
//

import Foundation

struct MasteryEffects : Codable {
    let effect : Int?
    let stats : [String]?

    enum CodingKeys: String, CodingKey {

        case effect = "effect"
        case stats = "stats"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        effect = try values.decodeIfPresent(Int.self, forKey: .effect)
        stats = try values.decodeIfPresent([String].self, forKey: .stats)
    }

}
