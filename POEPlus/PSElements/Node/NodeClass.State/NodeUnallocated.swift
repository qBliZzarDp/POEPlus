//
//  NodeUnallocated.swift
//  POEPlus
//
//  Created by Алексей Филатов on 29.11.2021.
//

import UIKit

struct NodeUnallocated: NodeStateProtocol {
    
    private let notable = UIImage(named: "NotableFrameUnallocated.png")
    private let jewel = UIImage(named: "JewelFrameUnallocated.png")
    private let passive = UIImage(named: "PSSkillFrame.png")
    private let blight = UIImage(named: "BlightedNotableFrameUnallocated.png")
    private let classStart = UIImage(named: "PSStartNodeBackgroundInactive.png")
    private let proxy = UIImage(named: "JewelSocketAltNormal.png")
    private let keystone = UIImage(named: "KeystoneFrameUnallocated.png")
    private let ascendancy = UIImage(named: "AscendancyMiddle.png")
    private let psAscendancy = UIImage(named: "AscendancyFrameSmallNormal")
    private let notableAscendancy = UIImage(named: "AscendancyFrameLargeNormal")
    private let mastery = TreeDataStorage.shared.masterySpritesDictionary

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
            guard let classStart = classStart else { break }
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
