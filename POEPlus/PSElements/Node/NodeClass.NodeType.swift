//
//  NodeClass.NodeType.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import Foundation

extension NodeClass {
    /// Энум, содержащий в себе типы умений
    enum NodeType {
        /// Пассивное умение
        case passiveSkill
        /// Умение мастерства
        case mastery
        /// Ключевое умение
        case keystone
        /// Значимое умение
        case notable
        /// Начальные (стартовые) умения
        case classStart
        /// Умения, которые доступны только через масла (блайт)
        case blight
        /// Слот для камней умений (джевелов)
        case jewelSocket
        /// Начальное умение класса восхождения
        case ascendancyStart
        /// Прокси умение
        case proxy
        /// Пассивные умения класса восхождения
        case psAscendancy
        /// Значимые умения класса восхождения
        case notbaleAscendancy
    }
}
