//
//  StringExtension.swift
//  POEPlus
//
//  Created by Алексей Филатов on 16.10.2021.
//

import Foundation

extension String {
    /// Метод для обработки названия изображения в ссылочном виде
    ///
    ///     let stringImage = "https://some.com/wifnwiehde/wejfbi2wk/image.png"
    ///     getimageName(string: stringImage)
    ///     // image.png
    ///
    /// - Parameter string: Принимает в себя строку-ссылку
    /// - Returns: возвращает конечное название изображения
    func getImageName() -> String {
        guard let index = self.lastIndex(of: "/") else { return self }
        return String(self[self.index(after: index)..<self.endIndex])
    }
    
    /// Метод для обработки названия изображения с коллекцией иконок
    ///
    ///     let string = "groups-3.png?7bd45ef2fa23c36073251d1e34ab10e4"
    ///     getimageName(string: string)
    ///     // groups-3.png
    ///
    /// Удаляет все после символа "?" и возвращает строку
    /// - Parameter string: Принимает в себя тип String (название изображения)
    /// - Returns: Возвращает тип String уже с нормальной интерпритацией
    func getImageSetsName() -> String {
        guard let index = self.firstIndex(of: "?") else { return self }
        return String(self[self.startIndex..<index])
    }
}
