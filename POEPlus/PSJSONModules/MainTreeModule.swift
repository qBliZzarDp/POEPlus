//
//  MainTreeModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import Foundation

/// Главная структура древа пассивных умений
struct MainTreeModule : Codable {
    /// Тип древа
    let tree: String?
    /// Массив классов
    let classes: [Classes]?
    /// Словарь групп [номер: группа]
    let groups: [Int: TreeNum]?
    /// Словарь нодов (уммений) [номер:умение]
    let nodes: [String: SkillNodes]?
    /// Большие изображения умений сила/ловкость
    let extraImages: [Int: ExtraImages]?
    /// Слоты для джевелов
    let jewelSlots: [Int]?
    /// минимальный х
    let minX: Int?
    /// минимальный у
    let minY: Int?
    /// максимальный х
    let maxX: Int?
    /// максимальный у
    let maxY: Int?
    /// Словарь изображений [название \ фрейм]
    /// - case small = "0.1246"
    /// - case preSmall = "0.2109"
    /// - case middle = "0.2972"
    /// - ase big = "0.3835"
    /// - case one = "1"
    let assets: [String: AssetsFrame]?
    /// Константы древа
    let constants: Constants?
    /// Изображения умений с их координатами, высотой и шириной
    let skillSprites: SkillSprites?
    /// уровень зума
    let imageZoomLevels: [Double]?

    enum CodingKeys: String, CodingKey {

        case classes = "classes"
        case groups = "groups"
        case nodes = "nodes"
        case extraImages = "extraImages"
        case jewelSlots = "jewelSlots"
        case assets = "assets"
        case constants = "constants"
        case skillSprites = "skillSprites"
        case imageZoomLevels = "imageZoomLevels"
        case minX = "min_x"
        case minY = "min_y"
        case maxX = "max_x"
        case maxY = "max_y"
        case tree = "tree"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        classes = try values.decodeIfPresent([Classes].self, forKey: .classes)
        groups = try values.decodeIfPresent([Int: TreeNum].self, forKey: .groups)
        nodes = try values.decodeIfPresent([String: SkillNodes].self, forKey: .nodes)
        extraImages = try values.decodeIfPresent([Int: ExtraImages].self, forKey: .extraImages)
        jewelSlots = try values.decodeIfPresent([Int].self, forKey: .jewelSlots)
        assets = try values.decodeIfPresent([String: AssetsFrame].self, forKey: .assets)
        constants = try values.decodeIfPresent(Constants.self, forKey: .constants)
        skillSprites = try values.decodeIfPresent(SkillSprites.self, forKey: .skillSprites)
        imageZoomLevels = try values.decodeIfPresent([Double].self, forKey: .imageZoomLevels)
        minX = try values.decodeIfPresent(Int.self, forKey: .minX)
        minY = try values.decodeIfPresent(Int.self, forKey: .minY)
        maxX = try values.decodeIfPresent(Int.self, forKey: .maxX)
        maxY = try values.decodeIfPresent(Int.self, forKey: .maxY)
        tree = try values.decodeIfPresent(String.self, forKey: .tree)
    }

}
