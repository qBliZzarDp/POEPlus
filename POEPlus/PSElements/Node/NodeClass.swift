//
//  NodeClass.swift
//  POEPlus
//
//  Created by Алексей Филатов on 27.10.2021.
//

import UIKit

/// Класс, представляющий собой умения пассивного древа
class NodeClass: UIButton {
    var nodeSettings = NodeSettings()
    var nodeModel: SkillNodes
    /// точка центра умения по Х координате
    var nodeXcenter: CGFloat = 0
    /// точка центра умения по У координате
    var nodeYcenter: CGFloat = 0
    /// Угл, на который необходимо закрепить умение в группе
    var nodeAngle: CGFloat = 0
    /// Центр группы, к которой относится умение
    var groupCenter: CGPoint = CGPoint(x: 0, y: 0)
    /// "x" позиция умения
    var x: CGFloat = 0
    /// "у" позиция умения
    var y: CGFloat = 0
    /// Массив коннекторов, относящихся к данному умению
    var path: [CAShapeLayer] = []
    /// Группа, относящаяся к умению
    let nodeGroup: Group
    /// ImageView с фреймом умения (ободком)
    let mainImageView = UIImageView()
    /// ImageView с изображением умения
    let bgImageView = UIImageView()
    /// Текущее изображение фрейма (ободка)
    var currentMainImage =  UIImage()
    /// Текущее изображение умения
    var currentBgImage = UIImage()
    /// Тип умения
    var nodeType = NodeType.passiveSkill
    /// Текущее состояние умения
    var nodeState = NodeState.normal {
        didSet {
            updateState()
            updatePath()
            print("Сработал didSet \(nodeState)") }
    }
    /// Ссылка на древо
    let tree = TreeDataStorage.shared
    
    init(nodes: SkillNodes, type: UIButton.ButtonType = .custom, group: Group) {
        self.nodeModel = nodes
        self.nodeGroup = group
        super.init(frame: .zero)
//        defineNodeType()
        define()
        defineAscendancy()
        createNode(group: group)
        actionButton(group: group)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Состояние кнопки и установка изображений в зависимости от состояние (ждет рефакторинга)
    /// Метод, отвечающий за смену состояния умения
    func changeState() {
        if nodeState == .normal {
            nodeState = .allocate
        } else if nodeState == .allocate {
            nodeState = .normal
        }
    }
    
    func updatePath() {
        for line in path {
            if line.strokeColor == #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1) {
                line.strokeColor = #colorLiteral(red: 0.5240191065, green: 0.5011639614, blue: 0.2445632527, alpha: 0.6986014259)
                line.lineWidth = 15.0
            } else {
            line.strokeColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            line.lineWidth = 20.0
            }
        }
    }
    
    private func updateState() {
        nodeState == .allocate ? setAllocateImage() : setNormalImage()
    }
    
    private func setAllocateImage() {
        bgImageView.image = tree.activeSpritesDictionary[nodeModel.icon ?? " "]
        mainImageView.image = nodeState.setImageName.setImages(for: nodeType, classStartIdx: nodeModel.classStartIndex ?? 0, masteryName: nodeModel.activeIcon ?? " ")
    }
    
    private func setNormalImage() {
        bgImageView.image = tree.inactiveSpritesDictionary[nodeModel.icon ?? " "]
        mainImageView.image = nodeState.setImageName.setImages(for: nodeType, classStartIdx: nodeModel.classStartIndex ?? 0, masteryName: nodeModel.inactiveIcon ?? " ")
    }
    
    private func actionButton(group: Group) {
        addAction { [self] in
            print("Выбрано умение = \(nodeType), name: \(nodeModel.name ?? "Неизвестное имя"), GroupNum = \(group.groupID), ОРБИТА = \(nodeModel.orbit ?? 0), NODEAGNLE = \(nodeAngle)")
            changeState()
            print("State was changed")
        }
    }

    /// Метод для определения умений, относящихся к умениям класса восхождения, установка их центра группы относительно новой позиции восхождения и замена фонового изображения группы на фон восхождения.
    func defineAscendancy() {
        if nodeType == .ascendancyStart {
            guard let name = nodeModel.ascendancyName, let image = nodeSettings.ascendancyImages[name] else { return }
            if let ascendancyImage = image {
                nodeGroup.x = nodeSettings.ascendancyPositions[name]?.x ?? 0
                nodeGroup.y = nodeSettings.ascendancyPositions[name]?.y ?? 0
                nodeGroup.setAscendancyImage(image: ascendancyImage)
            }
        }
        if nodeModel.ascendancyName != nil && nodeType != .ascendancyStart && nodeGroup.groupID != 7 {
            nodeGroup.image = nil
        }
    }

    /// Метод, отвечабщий за создание умения (нода) и помещения его на нужную позицию
    /// - Parameter group: группа умения, в которую добавляется нод
    func createNode(group: Group) {
        self.backgroundColor = .clear
        self.tintColor = .clear
        /// nodeAngle = orbitIndex * orbitMult[orbit]
        if let index = nodeModel.orbitIndex, let nodeOrbit = nodeModel.orbit {
            if nodeOrbit != 4 {
                nodeAngle = CGFloat(index) * nodeSettings.orbitMult[nodeOrbit]
            } else {
                nodeAngle = nodeSettings.orbitMultFull[index]
            }
            /// Определяем дистанцию по номеру орибиты (от 0 до 6)
            let dist = nodeSettings.orbitDist[nodeOrbit]
            /// создаем фрейм нода
            self.frame = CGRect(x: group.x, y: group.y, width: mainImageView.frame.size.width, height: mainImageView.frame.size.height)
            /// для правильной позиции необходимо отцентровать нод в группе
            self.center = CGPoint(x: self.frame.minX + (group.frame.width / 2), y: self.frame.minY + (group.frame.height / 2))
            groupCenter = center
            /// отрисовывем верную позицию по окружности
            self.center.x = self.center.x + sin(nodeAngle) * dist
            self.center.y = self.center.y - cos(nodeAngle) * dist
            nodeXcenter = center.x
            nodeYcenter = center.y
        }
    }
    // MARK: - Приватные методы

    /// Метод, отвечающий за определение типа умения, и установка его фрейм изображения и бэкграунд изображения
    private func define() {
        if nodeModel.isNotable == true { nodeType = .notable }
        if nodeModel.isAscendancyStart == true { nodeType = .ascendancyStart }
        if nodeModel.classStartIndex != nil { nodeType = .classStart }
        if nodeModel.isJewelSocket == true { nodeType = .jewelSocket }
        if nodeModel.isBlighted == true { nodeType = .blight }
        if nodeModel.isMastery == true { nodeType = .mastery }
        if nodeModel.isProxy == true { nodeType = .proxy }
        if nodeModel.isKeystone == true { nodeType = .keystone }
        if nodeType == .notable && nodeModel.ascendancyName != nil { nodeType = .notbaleAscendancy }
        if nodeType == .passiveSkill && nodeModel.ascendancyName != nil { nodeType = .psAscendancy }
        setupMainImage(image: nodeState.setImageName.setImages(for: nodeType,
                                                                  classStartIdx: nodeModel.classStartIndex ?? 0,
                                                                  masteryName: nodeModel.inactiveIcon ?? " "))
        if nodeType != .classStart && nodeType != .ascendancyStart {
            setupBgImage(image: tree.inactiveSpritesDictionary[nodeModel.icon ?? " "]) }
    }

    /// Метод для установки  фрейма (ободка) изображения умения
    /// - Parameter image: изображение фрейма умения
    private func setupMainImage(image: UIImage?) {
        guard let mainImage = image else { return }
        currentMainImage = mainImage
        configMainImageView()
        if nodeType == .mastery { doCirlceMain() }
    }
    
    /// Метод для установки изображения самого умения
    /// - Parameter image: изображение умения
    private func setupBgImage(image: UIImage?) {
        guard let bgImage = image else { return }
        currentBgImage = bgImage
        configBgImageView()
    }
    
    /// Метод для настройки изображения умения
    private func configBgImageView() {
        bgImageView.image = currentBgImage
        bgImageView.frame.size = CGSize(width: mainImageView.frame.size.width * 0.64, height: mainImageView.frame.size.height * 0.64)
        bgImageView.layer.cornerRadius = bgImageView.frame.size.height / 2
        bgImageView.layer.masksToBounds = true
        bgImageView.center = CGPoint(x: mainImageView.frame.width / 2,
                                     y: mainImageView.frame.height / 2)
        self.insertSubview(bgImageView, belowSubview: mainImageView)
    }
    
    /// Метод  конфигуарции фрейма (ободка) умения
    private func configMainImageView() {
        mainImageView.image = currentMainImage
        mainImageView.frame.size = CGSize(width: currentMainImage.size.width * 2.6, height: currentMainImage.size.height * 2.6)
        self.addSubview(mainImageView)
    }
    
    /// Метод, который используется для умений мастерства, чтобы назначить им точный фрейм и область нажатия
    private func doCirlceMain() {
        mainImageView.frame.size = CGSize(width: currentMainImage.size.width * 1.8, height: currentMainImage.size.height * 1.8)
        mainImageView.layer.cornerRadius = mainImageView.frame.size.height / 2
        mainImageView.layer.masksToBounds = true
    }
}
