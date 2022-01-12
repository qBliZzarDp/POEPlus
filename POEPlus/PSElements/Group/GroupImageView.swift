//
//  GroupImageView.swift
//  POEPlus
//
//  Created by Алексей Филатов on 21.10.2021.
//

import UIKit

class Group: UIImageView {
    /// х - координата расположения
    var x: CGFloat = 0.0
    /// у - координата расположения
    var y: CGFloat = 0.0
    /// количество орбит и их размер, где:
    /// 0 - центр
    /// 1 - первая, 2 - вторая и т.д
    var orbits: [Int] = []
    /// Является ли проки?
    var isProxys: Bool?
    /// Содержит массив номеров пассивных умений
    var nodes: [String] = []
    /// ImageView для отображения эффектов умений мастерства
    var effectImage = UIImageView()
    /// Порядковый номер группы
    var groupID: Int
    
    init(group: TreeNum, groupID: Int) {
        self.groupID = groupID
        super.init(frame: .zero)
        self.x = group.x
        self.y = group.y
        self.orbits = group.orbits
        self.nodes = group.nodes
        self.isProxys = group.isProxy
        createGroup()
        self.layer.cornerRadius = frame.size.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Установка фонового изображения восхождения
    func setAscendancyImage(image: UIImage) {
        backgroundColor = .clear
        tintColor = .clear
        self.image = image
        self.frame = CGRect(x: x, y: y, width: image.size.width * 2.6, height: image.size.height * 2.6)
        let newX = x - (frame.size.width / 2)
        let newY = y - (frame.size.height / 2)
        x = newX
        y = newY
        self.frame = CGRect(x: x, y: y, width: image.size.width * 2.6, height: image.size.height * 2.6)
    }
    
    // MARK: - Приватные методы

    /// установка фона группы и подгон размеров под изображение
    private func setBackgroundImage(image: BackgroundImage) {
        backgroundColor = .clear
        tintColor = .clear
        self.image = image.image
        self.frame = CGRect(x: x, y: y, width: image.image.size.width * 2.6, height: image.image.size.height * 2.6)
        let newX = x - (frame.size.width / 2)
        let newY = y - (frame.size.height / 2)
        x = newX
        y = newY
        self.frame = CGRect(x: x, y: y, width: image.image.size.width * 2.6, height: image.image.size.height * 2.6)
    }

    /// Является ли эта группа группой с кластерными самоцветами?
    private func isJewelOrbit() -> Bool {
        return (isProxys ?? false)
    }

    /// Создание background'a группы
    private func createGroup() {
        if orbits.contains(3) {
            isJewelOrbit() ? setBackgroundImage(image: .jewel(.large)) : setBackgroundImage(image: .large)
        } else if orbits.contains(2) {
            isJewelOrbit() ? setBackgroundImage(image: .jewel(.medium)) : setBackgroundImage(image: .medium)
        } else if orbits.contains(1) {
            isJewelOrbit() ? setBackgroundImage(image: .jewel(.small)) : setBackgroundImage(image: .small)
        } else if orbits.contains(0) {
            self.frame = CGRect(x: x, y: y, width: 1, height: 1)
        }
    }
}
