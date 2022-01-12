//
//  SkillNodesModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import Foundation

/// Структура пассивных умений
struct SkillNodes: Codable {
    /// Номер  умения
    var skill: Int?
    /// Имя умения
    var name: String?
    /// Иконка умения
    var icon: String?
    /// Значимое умение?
    var isNotable: Bool?
    /// Начало восхождения?
    var isAscendancyStart: Bool?
    /// Начальное умение и его индекс
    var classStartIndex: Int?
    /// Является ли узел узлом с несколькими вариантами выбора
    var isMultipleChoice: Bool?
    /// Является ли узел опцией выбора для узла с несколькими вариантами выбора
    var isMultipleChoiceOption: Bool?
    /// Является ли это местом для джевела?
    var isJewelSocket: Bool?
    /// Доступно только через масла
    var isBlighted: Bool?
    /// Это прокси?
    var isProxy: Bool?
    /// Ключевое умение
    var isKeystone: Bool?
    /// Сколько пассивных очков дарует
    var grantedPassivePoints: Int?
    /// Сколько дает ловоксти
    var grantedDexterity: Int?
    /// Сколько дает силы
    var grantedStrength: Int?
    /// Сколько дает интеллекта
    var grantedIntelligence: Int?
    /// Расширение для джевелов.
    var expansionJewel: ExpansionJewel?
    /// Является ли узел мастерством
    /// т.е. в центре определенных кругов есть навыки которые  также являются пассивными узлами навыков
    var isMastery: Bool?
    /// Массив структуры "MasteryEffects", где расположены номер и статы, дарующие мастерством
    var masteryEffects: [MasteryEffects]?
    /// Неактивная иконка мастерки
    var inactiveIcon: String?
    /// Активная иконка мастерки
    var activeIcon: String?
    /// Эффект активной мастерки (фон)
    var activeEffectImage: String?
    /// Рецепт масел
    var recipe: [String]?
    /// Имя восхождения
    var ascendancyName: String?
    /// Статы
    var stats: [String]?
    /// Описание
    var reminderText: [String]?
    /// Номер группы
    var group: Int?
    /// Номер орбиты
    /// Радиус орбиты (0 to 4, orbitRadii = [0, 82, 162, 335, 493])
    var orbit: Int?
    /// Индекс орбиты
    var orbitIndex: Int?
    /// Выходящие умения
    var out: [String]?
    /// Входящие умения
    var `in`: [String]?
}
