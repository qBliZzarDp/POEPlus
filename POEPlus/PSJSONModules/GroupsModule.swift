//
//  GroupsModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import UIKit

/// Настройки групп  пассивных умений
struct TreeNum: Codable {
    /// х - координата расположения
    var x: CGFloat
    /// у - координата расположения
    var y: CGFloat
    /// количество орбит и их размер, где:
    /// 0 - центр
    /// 1 - первая, 2 - вторая и т.д
    var orbits: [Int]
    /// Является ли проки?
    var isProxy: Bool?
    /// Содержит массив номеров пассивных умений
    var nodes: [String]
}
