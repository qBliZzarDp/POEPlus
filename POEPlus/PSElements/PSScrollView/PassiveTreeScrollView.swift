//
//  PassiveTreeScrollView.swift
//  POEPlus
//
//  Created by Алексей Филатов on 24.10.2021.
//

import UIKit

class PassiveTreeScrollView: UIScrollView {

    /// Контент вью древа для отображения нодов, групп и прочих спрайтов
    private var contentView: UIView

    //MARK: - LifeCycle
    init(contentView: UIView, frame: CGRect) {
        self.contentView = contentView
        super.init(frame: frame)
        configureScrollView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        centerTree()
    }

    //MARK: - Приватные методы
    /// Конфигурация ScrollView и устанавка зум-настроек для него
    private func configureScrollView() {
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = .fast
        self.backgroundColor = #colorLiteral(red: 0.04802367301, green: 0.0634347555, blue: 0.09249411975, alpha: 1)
        self.addSubview(contentView)
        setZoom()
        self.zoomScale = minimumZoomScale
    }

    //MARK: - Работа с зумом
    /// Установка зума в зависимости от величин
    private func setZoom() {
        let boundSize = self.bounds.size
        let contentSize = contentView.bounds.size
        
        let xScale = boundSize.width / contentSize.width
        let yScale = boundSize.height / contentSize.height
        
        let minScale = min(xScale, yScale)
        var maxScale: CGFloat = 1
        
        if minScale < 0.1 {
            maxScale = 0.5
        }
        
        self.minimumZoomScale = minScale
        self.maximumZoomScale = maxScale
    }

    /// Центрирование контентвью на экране для качественного отображения
    private func centerTree() {
        let boundSize = self.bounds.size
        var frameToCenter = contentView.frame
        
        if frameToCenter.size.width < boundSize.width {
            frameToCenter.origin.x = (boundSize.width - frameToCenter.size.width) / 2
        } else {
            frameToCenter.origin.x = 0
        }
        if frameToCenter.size.height < boundSize.height {
            frameToCenter.origin.y = (boundSize.height - frameToCenter.size.height) / 2
        } else {
            frameToCenter.origin.y = 0
        }
        contentView.frame = frameToCenter
        print("test created")
    }
}

// MARK: - Delegate
extension PassiveTreeScrollView: UIScrollViewDelegate {
    /// Установка зума для древа
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }

    /// Центрирование древа по х/у при зуме для качественного отображения
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerTree()
    }
}
