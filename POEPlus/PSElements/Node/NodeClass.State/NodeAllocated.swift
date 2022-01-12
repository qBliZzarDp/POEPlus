//
//  NodeAllocated.swift
//  POEPlus
//
//  Created by Алексей Филатов on 30.11.2021.
//

import UIKit

struct NodeAllocated: NodeStateProtocol {

    private let notable = UIImage(named: "NotableFrameAllocated.png")
    private let jewel = UIImage(named: "JewelFrameUnallocated.png")
    private let passive = UIImage(named: "PSSkillFrameActive.png")
    private let blight = UIImage(named: "BlightedNotableFrameAllocated.png")
    private let proxy = UIImage(named: "JewelSocketAltActive.png")
    private let keystone = UIImage(named: "KeystoneFrameAllocated.png")
    private let ascendancy = UIImage(named: "AscendancyMiddle.png")
    private let mastery = TreeDataStorage.shared.masterySpritesDictionary
    private let psAscendancy = UIImage(named: "AscendancyFrameSmallAllocated")
    private let notableAscendancy = UIImage(named: "AscendancyFrameLargeAllocated")
    private let classStart: [UIImage?] = [
        UIImage(named: "centerscion.png"),
        UIImage(named: "centermarauder.png"),
        UIImage(named: "centerranger.png"),
        UIImage(named: "centerwitch.png"),
        UIImage(named: "centerduelist.png"),
        UIImage(named: "centertemplar.png"),
        UIImage(named: "centershadow.png")]

    func setImages(for type: NodeClass.NodeType, classStartIdx: Int, masteryName: String) -> UIImage {
        switch type {
        case .passiveSkill:
            guard let passive = passive else { break }
            return passive
        case .mastery:
            guard let mastery = mastery[masteryName] else { break }
            return mastery
        case .keystone:
            guard let keystone = keystone else { break }
            return keystone
        case .notable:
            guard let notable = notable else { break }
            return notable
        case .classStart:
            guard let classStart = classStart[classStartIdx] else { break }
            return classStart
        case .blight:
            guard let blight = blight else { break }
            return blight
        case .jewelSocket:
            guard let jewel = jewel else { break }
            return jewel
        case .ascendancyStart:
            guard let ascendancy = ascendancy else { break }
            return ascendancy
        case .proxy:
            guard let proxy = proxy else { break }
            return proxy
        case .psAscendancy:
            guard let psAscendancy = psAscendancy else { break }
            return psAscendancy
        case .notbaleAscendancy:
            guard let notableAscendancy = notableAscendancy else { break }
            return notableAscendancy
        }
        print("Error to set image for type = \(type)")
        return UIImage()
    }
}
