//
//  ClassesModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 09.10.2021.
//

import Foundation
import UIKit

///Получаем все классы
struct Classes: Codable{
    /// Имя класса
    var name: String
    /// Базовая сила
    var base_str: Int
    /// Базовая ловкость
    var base_dex: Int
    /// Базовый интеллект
    var base_int: Int
    /// Классы восхождения
    var ascendancies: [POEAscendacies]
}
/// Получение классов восхождения
struct POEAscendacies: Codable {
    /// ID класса
    var id: String
    /// имя класса
    var name: String
    /// Текст класса
    var flavourText: String?
    /// Цвет текста
    var flavourTextColour: String?
    /// Поле текста по координатам
    var flavourTextRect: FlavourTextRect?
}
/// Структура координат текста для классов Восхождения
struct FlavourTextRect: Codable {
    /// х - координата
    var x: Int
    /// у - координата
    var y: Int
    /// ширина
    var width: Int
    /// высота
    var height: Int
}
