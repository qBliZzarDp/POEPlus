//
//  TreeDataStorage.swift
//  POEPlus
//
//  Created by Алексей Филатов on 17.10.2021.
//

import UIKit

final class TreeDataStorage {
    
    static let shared = TreeDataStorage()

    var passiveTree: MainTreeModule?

    /// Текущие ноды, расположенные на вью
    var nodeArray: [NodeClass] = []
    /// Текующие группы, расположенные на вью
    var groupArray: [Group] = []
    /// Массив нодов, переданных из JSON
    var skillNodes: [SkillNodes] = []
    /// Массив классов, переданных из JSON
    var classes: [Classes] = []
    /// Все спрайты умений мастерства
    var masterySpritesDictionary: [String:UIImage] = [:]
    /// Все спрайты активированных умений
    var activeSpritesDictionary: [String:UIImage] = [:]
    /// Все спрайты не активированных умений
    var inactiveSpritesDictionary: [String:UIImage] = [:]
    
}
