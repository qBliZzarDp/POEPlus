//
//  PassiveTreeWorker.swift
//  POEPlus
//
//  Created by Алексей Филатов on 26.11.2021.
//

import UIKit

/// Воркер для получения и распарсивания JSON файла древа пассивных умений,а также первичной обработки древа
public final class PassiveTreeWorker {
    typealias responseHandler = (_ response: PassiveTree.Response) -> ()
    
    private let psTreeStorage = TreeDataStorage.shared
    /// Спрайты всех умений древа, переданных из JSON для дробления в отдельные массивы.
    private var skillSprites: SkillSprites?
    // Активные ноды для передачи в словарь activeSpritesDictionary
    private var normalActive: [SpritesData] = []
    private var keystoneActive: [SpritesData] = []
    private var notableActive: [SpritesData] = []
    // Не активированные ноды для передачи в словарь inactiveSpritesDictionary
    private var keystoneInactive: [SpritesData] = []
    private var normalInactive: [SpritesData] = []
    private var notableInactive: [SpritesData] = []
    // Спрайты мастерок для передачи в словарь masterySpritesDictionary
    private var masteryActiveEffect: [SpritesData] = []
    private var masteryInactive: [SpritesData] = []
    private var masteryActiveSelected: [SpritesData] = []
    private var masteryConnected: [SpritesData] = []
    
    func startLoad(onSucces: @escaping (responseHandler), onError: @escaping (responseHandler)) {
        getJsonFromFile(onSucces: onSucces, onError: onError)
        getTreeSprites(onError: onError)
    }
    
    //MARK: - Приватные методы
    /// Метод для получения структуры древа из JSON файла
    /// - Parameter complitionHandler: структура MainTreeModule для дальнейшей обработки
    private func getJsonFromFile(onSucces: @escaping (responseHandler), onError: @escaping (responseHandler)) {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            let jsonDecoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let passiveTree = try jsonDecoder.decode(MainTreeModule.self, from: data)
                psTreeStorage.passiveTree = passiveTree
                onSucces(PassiveTree.Response(isError: false, message: nil))
            } catch let error {
                onError(PassiveTree.Response(isError: true, message: "JSON data error: \n \(error)"))
            }
        }
    }
    
    /// Необходимы для переноса значений в синглтон
    private func getTreeSprites(onError: @escaping (responseHandler)) {
        ///Получения групп
        if let sprites = psTreeStorage.passiveTree?.skillSprites { skillSprites = sprites } else {
            onError(PassiveTree.Response(isError: true, message: "Sprites dependencies error")) }
        /// Получение всех спрайтов
        spritesHandler(onError: onError)
        imageHandler()
    }
    
    // MARK: - Работа с изображениями и иконками
    
    /// Метод, обрабатывающий массив структуры SpritesData для получения коллекции изображений необходимого размера с последующим добавлением их в словарь.
    /// - Parameters:
    ///   - array: массив [SpritesData]
    ///   - withSpritesSetName: имя коллекции изображений
    ///   - toDictionaty: словарь, в который будут помещены изображения [String:UIImage]
    private func loadImageCollection(from array: [SpritesData], withSpritesSetName: String, toDictionaty: inout [String: UIImage]) {
        array.filter {$0.filename?.getImageName().getImageSetsName() == withSpritesSetName}
        .forEach { $0.coords?
        .forEach { (imageName, coords) in
            if let image = UIImage(named: withSpritesSetName)?
                .cgImage?.cropping(to: CGRect(x: coords.x, y: coords.y, width: coords.w, height: coords.h))
            { toDictionaty[imageName] = UIImage(cgImage: image) } }
        }
    }
    
    /// Загрузка спрайтов
    private func spritesHandler(onError: @escaping (responseHandler)) {
        if let spritesNormalActive = skillSprites?.normalActive { normalActive = spritesNormalActive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesNormalActive not find")) }
        if let spritesKeystoneActive = skillSprites?.keystoneActive { keystoneActive = spritesKeystoneActive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesKeystoneActive not find")) }
        if let spritesNotableActive = skillSprites?.notableActive { notableActive = spritesNotableActive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesNotableActive not find")) }
        if let spritesKeystoneInactive = skillSprites?.keystoneInactive { keystoneInactive = spritesKeystoneInactive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesKeystoneInactive not find")) }
        if let spritesNormalInactive = skillSprites?.normalInactive { normalInactive = spritesNormalInactive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesNormalInactive not find")) }
        if let spritesNotableInactive = skillSprites?.notableInactive { notableInactive = spritesNotableInactive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesNotableInactive not find")) }
        if let spritesMasteryActive = skillSprites?.masteryActiveEffect { masteryActiveEffect = spritesMasteryActive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesMasteryActive not find")) }
        if let spritesMasteryInactive = skillSprites?.masteryInactive { masteryInactive = spritesMasteryInactive } else {
            onError(PassiveTree.Response(isError: true, message: "spritesMasteryInactive not find")) }
        if let spritesMasterySelected = skillSprites?.masteryActiveSelected { masteryActiveSelected = spritesMasterySelected } else {
            onError(PassiveTree.Response(isError: true, message: "spritesMasterySelected not find")) }
        if let spritesMasteryConnected = skillSprites?.masteryConnected { masteryConnected = spritesMasteryConnected } else {
            onError(PassiveTree.Response(isError: true, message: "spritesMasteryConnected not find")) }
    }
    
    /// Обработка изображений и помещение их в словарь
    private func imageHandler() {
        let activeSprites = "skills-3.jpg"
        let inactiveSprites = "skills-disabled-3.jpg"
        let masteryDisabledSprites = "mastery-disabled-3.png"
        let masteryActiveSprites = "mastery-active-selected-3.png"
        let masteryEffect = "mastery-active-effect-0.png"
        
        loadImageCollection(from: notableActive, withSpritesSetName: activeSprites, toDictionaty: &psTreeStorage.activeSpritesDictionary)
        
        loadImageCollection(from: normalActive, withSpritesSetName: activeSprites, toDictionaty: &psTreeStorage.activeSpritesDictionary)
        
        loadImageCollection(from: keystoneActive, withSpritesSetName: activeSprites, toDictionaty: &psTreeStorage.activeSpritesDictionary)
        
        loadImageCollection(from: normalInactive, withSpritesSetName: inactiveSprites, toDictionaty: &psTreeStorage.inactiveSpritesDictionary)
        
        loadImageCollection(from: keystoneInactive, withSpritesSetName: inactiveSprites, toDictionaty: &psTreeStorage.inactiveSpritesDictionary)
        
        loadImageCollection(from: notableInactive, withSpritesSetName: inactiveSprites, toDictionaty: &psTreeStorage.inactiveSpritesDictionary)
        
        loadImageCollection(from: masteryInactive, withSpritesSetName: masteryDisabledSprites, toDictionaty: &psTreeStorage.masterySpritesDictionary)
        
        loadImageCollection(from: masteryActiveSelected, withSpritesSetName: masteryActiveSprites, toDictionaty: &psTreeStorage.masterySpritesDictionary)
        
        loadImageCollection(from: masteryActiveEffect, withSpritesSetName: masteryEffect, toDictionaty: &psTreeStorage.masterySpritesDictionary)
    }
}
