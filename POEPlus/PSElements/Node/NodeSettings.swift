//
//  NodeSettings.swift
//  POEPlus
//
//  Created by Алексей Филатов on 22.11.2021.
//

import UIKit

struct NodeSettings {
    /// Массив с 40 орбитами, которыми являются orbitIndex
    /// - Максимальный индекс = 39
    let orbitAngle: [CGFloat] = [0, 10, 20, 30, 40, 45, 50, 60, 70, 80, 90, 100, 110, 120, 130, 135, 140, 150, 160, 170, 180, 190, 200, 210, 220, 225, 230, 240, 250, 260, 270, 280, 290, 300, 310, 315, 320, 330, 340, 350]

    /// Полный массив с орбитами для их подсчета
    let orbitMultFull: [CGFloat] = [
        0,
        10 * CGFloat.pi / 180,
        20 * CGFloat.pi / 180,
        30 * CGFloat.pi / 180,
        40 * CGFloat.pi / 180,
        45 * CGFloat.pi / 180,
        50 * CGFloat.pi / 180,
        60 * CGFloat.pi / 180,
        70 * CGFloat.pi / 180,
        80 * CGFloat.pi / 180,
        90 * CGFloat.pi / 180,
        100 * CGFloat.pi / 180,
        110 * CGFloat.pi / 180,
        120 * CGFloat.pi / 180,
        130 * CGFloat.pi / 180,
        135 * CGFloat.pi / 180,
        140 * CGFloat.pi / 180,
        150 * CGFloat.pi / 180,
        160 * CGFloat.pi / 180,
        170 * CGFloat.pi / 180,
        180 * CGFloat.pi / 180,
        190 * CGFloat.pi / 180,
        200 * CGFloat.pi / 180,
        210 * CGFloat.pi / 180,
        220 * CGFloat.pi / 180,
        225 * CGFloat.pi / 180,
        230 * CGFloat.pi / 180,
        240 * CGFloat.pi / 180,
        250 * CGFloat.pi / 180,
        260 * CGFloat.pi / 180,
        270 * CGFloat.pi / 180,
        280 * CGFloat.pi / 180,
        290 * CGFloat.pi / 180,
        300 * CGFloat.pi / 180,
        310 * CGFloat.pi / 180,
        315 * CGFloat.pi / 180,
        320 * CGFloat.pi / 180,
        330 * CGFloat.pi / 180,
        340 * CGFloat.pi / 180,
        350 * CGFloat.pi / 180]
    
    ///Массив с Double значениями для умножения орбит index.max = 6
    let orbitMult: [CGFloat] = [0, CGFloat.pi / 3, CGFloat.pi / 6, CGFloat.pi / 6, CGFloat.pi / 6, CGFloat.pi / 36, CGFloat.pi / 36]
    
    /// Массив с Double значениями для дистанирования орбит index.max = 6
    let orbitDist: [CGFloat] = [0, 82, 162, 335, 493, 662, 845]
    
    /// Массив названий изображений начальных умений
    let classArt: [String] = [
        "centerscion.png",
        "centermarauder.png",
        "centerranger.png",
        "centerwitch.png",
        "centerduelist.png",
        "centertemplar.png",
        "centershadow.png"]
    ///  Словарь со всеми классами восхождения и их изображениями
    let ascendancyImages: [String: UIImage?] =
        ["Ascendant": UIImage(named: "ClassesAscendant.png"),
         "Assassin": UIImage(named: "ClassesAssassin.png"),
         "Berserker": UIImage(named: "ClassesBerserker.png"),
         "Champion": UIImage(named: "ClassesChampion.png"),
         "Chieftain": UIImage(named: "ClassesChieftain.png"),
         "Deadeye": UIImage(named: "ClassesDeadeye.png"),
         "Elementalist": UIImage(named: "ClassesElementalist.png"),
         "Gladiator": UIImage(named: "ClassesGladiator.png"),
         "Guardian": UIImage(named: "ClassesGuardian.png"),
         "Hierophant": UIImage(named: "ClassesHierophant.png"),
         "Inquisitor": UIImage(named: "ClassesInquisitor.png"),
         "Juggernaut": UIImage(named: "ClassesJuggernaut.png"),
         "Necromancer": UIImage(named: "ClassesNecromancer.png"),
         "Occultist": UIImage(named: "ClassesOccultist.png"),
         "Pathfinder": UIImage(named: "ClassesPathfinder.png"),
         "Raider": UIImage(named: "ClassesRaider.png"),
         "Saboteur": UIImage(named: "ClassesSaboteur.png"),
         "Slayer": UIImage(named: "ClassesSlayer.png"),
         "Trickster": UIImage(named: "ClassesTrickster.png"),]
    /// Словарь расположения классов восхождений
    let ascendancyPositions: [String: CGPoint] =
        ["Juggernaut": CGPoint(x: -10400, y: 5200),
        "Berserker": CGPoint(x: -10400, y: 3700),
        "Chieftain": CGPoint(x: -10400, y: 2200),
        "Raider": CGPoint(x: 10200, y: 5200),
        "Deadeye": CGPoint(x: 10200, y: 2200),
        "Pathfinder": CGPoint(x: 10200, y: 3700),
        "Occultist": CGPoint(x: -1500, y: -9850),
        "Elementalist": CGPoint(x: 0, y: -9850),
        "Necromancer": CGPoint(x: 1500, y: -9850),
        "Slayer": CGPoint(x: 1500, y: 9800),
        "Gladiator": CGPoint(x: -1500, y: 9800),
        "Champion": CGPoint(x: 0, y: 9800),
        "Inquisitor": CGPoint(x: -10400, y: -2200),
        "Hierophant": CGPoint(x: -10400, y: -3700),
        "Guardian": CGPoint(x: -10400, y: -5200),
        "Assassin": CGPoint(x: 10200, y: -5200),
        "Trickster": CGPoint(x: 10200, y: -3700),
        "Saboteur": CGPoint(x: 10200, y: -2200),
        "Ascendant": CGPoint(x: -7800, y: 7200)]
}
