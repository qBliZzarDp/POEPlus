//
//  ExtraImagesModule.swift
//  POEPlus
//
//  Created by Алексей Филатов on 13.10.2021.
//

import Foundation

/// Структура размеров изображений  и их координат
struct ExtraImages: Codable{
    /// х - координата
    var x: Double
    /// у - координата
    var y: Double
    /// Название изображения
    var image: String
}
