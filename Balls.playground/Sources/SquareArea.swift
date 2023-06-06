import UIKit

protocol SquareAreaProtocol {
    init(size: CGSize, color: UIColor)
    // установить шарики в область
    func setBalls(withColor: [UIColor], andRadius: Int)
}

public class SquareArea: UIView, SquareAreaProtocol {
    private var balls: [Ball] = []
    // aниматор графичесаких объектов
    private var animator: UIDynamicAnimator?
    // обработчик перемещений объектов
    private var snapBehavior: UISnapBehavior?
    // обработчик столкновений
    private var collisionBehavior: UICollisionBehavior
    
    public required init(size: CGSize, color: UIColor) {
        // cоздание обработчика столкновений
        collisionBehavior = UICollisionBehavior(items: [])
        // cтроим прямоугольную графическую область
        super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        // изменяем цвет фона
        self.backgroundColor = color
        // указываем границы прямоугольной области
        // как объекты взаимодействия
        // чтобы об них могли ударяться шараки
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        // подключаем аниматор с указанием на сам класс
        animator = UIDynamicAnimator(referenceView: self)
        // подключаем к аниматору обработчик столкновений
        animator?.addBehavior(collisionBehavior)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setBalls(withColor ballsColor: [UIColor], andRadius radius: Int) {
        // перебираем переданные цвета
        // один цвет - один шарик
        for (index, oneBallColor) in ballsColor.enumerated() {
            // рассчитываем координату левого верхнего угда шарика
            let coordinateX = 10 + (2 * radius) * index
            let coordinateY = 10 + (2 * radius) * index
            // создаем экземпляр класса шарик
            let ball = Ball(color: oneBallColor, radius: radius, coordinates: (x: coordinateX, y: coordinateY))
            // добавляем шарик в текущее отображение
            // в состав прямоугольной площадки
            self.addSubview(ball)
            // добавляем шарик в коллекцию шариков
            self.balls.append(ball)
            // добавляем шарик в обработчик столкновений
            collisionBehavior.addItem(ball)
        }
    }
    // метод срабатывает в момент касания
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            for ball in balls {
                if (ball.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                    snapBehavior?.damping = 0.3
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    // метод срабатывает в момент перемещения пальца коснувшегося экрана
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            if let snapBehavior = snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    // метод вызывается по окончании взаимодействия с экраном (палец убран)
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }
}
