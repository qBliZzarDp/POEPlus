//
//  JewelModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import Foundation

// Джевел настройки если не скилл
/// Структура, представляющая собой расширение джевелов
/// - size - размер
/// - index - индекс места
/// - proxy - для доступа
/// - parent - родительская ячейка
struct ExpansionJewel: Codable {
    var size: Int?
    var index: Int?
    var proxy: String?
    var parent: String?
}
