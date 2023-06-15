import UIKit
import Foundation
// объявление протокола
protocol BallProtocol {
    init(color: UIColor, radius: Int, coordinates: (x: Int, y: Int))
}

class Ball: UIView, BallProtocol {
    required public init(color: UIColor, radius: Int, coordinates: (x: Int, y: Int)) {
        // cоздание графического прямогугольника
        super.init(frame:
                    CGRect(x: coordinates.x,
                           y: coordinates.y,
                           width: radius * 2,
                           height: radius * 2))
        // cкругление углов
        self.layer.cornerRadius = self.bounds.width / 2.0
        // изменение цвета фона
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
