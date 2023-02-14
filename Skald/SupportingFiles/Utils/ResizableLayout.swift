//
//  ResizableLayout.swift
//  Skald
//
//  Created by Александр Прайд on 23.12.2022.
//

import UIKit

struct StoriesCellConstants {
    // Константы с размерами для двух типов ячеек
    static let featuredHeight: CGFloat = 280
    static let standartHeight: CGFloat = 100
}

//protocol StoriesResizableLayoutDelegate: AnyObject {
//    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize
//}


class ResizableLayout: UICollectionViewLayout {
    
    //weak var delegate: StoriesResizableLayoutDelegate!
    let dragOffset: CGFloat = StoriesCellConstants.featuredHeight - StoriesCellConstants.standartHeight
    
    // свойство для кэширование атрибутов
    var cacheAttributes = [UICollectionViewLayoutAttributes]()
    
    // Устанавливаем индекс выбранной ячейки,
    // Которая находится вверху.
    // Чтобы знать индекс выбранной ячейки, нам нужно его посчитать.
    var featuredItemIndex: Int {
        // Учитываем текущий offset по 'y'
        // Получаем в формате Int
        // Кроме того с помщью max обезопасим коллекцию,
        // Что бы не уходила в минусовое значение
//        guard let result = Int(collectionView?.contentOffset.y ?? 00) else { return 0 }
//        guard let featuredItemIndex =  result / dragOffset else { return 50 }
//        return featuredItemIndex
        max(0 , Int(collectionView!.contentOffset.y / dragOffset))
    }
    
    // Подсчитаем приближение(процентный прирост ячейки)
    // 0...1
    var percentageOffset: CGFloat {
        collectionView!.contentOffset.y / dragOffset - CGFloat(featuredItemIndex)
    }
    
    // Свойства для того, чтобы не тянуть постоянно bounds;
    var width: CGFloat {
        guard let width = collectionView?.bounds.width else { return 100 }
        return width
    }
    
    var height: CGFloat {
        guard let height = collectionView?.bounds.height else { return 200 }
        return height
    }
    
    // Свойство для хранения количества items
    var numberOfItems: Int {
        guard let numberOfItems = collectionView?.numberOfItems(inSection: 0) else { return 0 }
        return numberOfItems
    }
}

extension ResizableLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // метод срабатывает при скроллинге и запрашивает
        // обновление layout
        // установив true, мы можем отлавливать перемещение пальца по экрану
        // и их корректировать
        true
    }
    
    override var collectionViewContentSize: CGSize {
        // важно учитывать не только видимую область,
        // но область которая отображает всё возможное содержимое collectionView
        // с помощью этого свойства мы и сможем это рассчитать
        // сперва вычислим высоту, отняв линний dragOffset
        let height = CGFloat(numberOfItems) * dragOffset + height - dragOffset
        return CGSize(width: width, height: height)
    }
    
    // метод, в котором будут вычисляться все необходимые настройки фреймов
    // для наших ячеек
    override func prepare() {
        // при входе в метод, чистим аттрибуты,
        cacheAttributes.removeAll()
        // затем заново их рассчитываем
        // устанавливаем базовое значение фрейма
        var frame: CGRect = .zero
        var y: CGFloat = 0
        
        for index in 0..<numberOfItems {
            let path = IndexPath(item: index, section: 0)
            // получаем перечень атрибутов
            let attributes = UICollectionViewLayoutAttributes(forCellWith: path)
            
            // Вычисляем значение высоты для каждого типа ячеек
            var height = StoriesCellConstants.standartHeight
            
            // featured
            if path.item == featuredItemIndex {
                y = collectionView!.contentOffset.y - StoriesCellConstants.standartHeight * percentageOffset
                height = StoriesCellConstants.featuredHeight
            } else if path.item == (featuredItemIndex + 1) {
                // featuredNext
                height = StoriesCellConstants.standartHeight + max(0, dragOffset * percentageOffset)
                
                let yMax = y + StoriesCellConstants.standartHeight
                // отнимаем вычисленную высоту
                y = yMax - height
            }
            
            // собираем проделанные выше вычисления
            frame = CGRect(x: 0, y: y, width: width, height: height)
            
            // размещаем ячейки на разных увронях с помощью координаты z
            // это позволит нам сложить ячейки как колоду карт по координате z
            attributes.zIndex = index
            
            // передаём фрейм атрибутам
            attributes.frame = frame
            // помещаем в закэшированные атрибуты настроенные атрибуты
            cacheAttributes.append(attributes)
            // устанавливаем значение y
            y = frame.maxY
        }
    }
    
    // выше мы закэшировали наши атрибуты и теперь нам их нужно проитерировать
    // по закэшированным значениям
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var resultAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in resultAttributes {
            if attribute.frame.intersects(rect) {
                resultAttributes.append(attribute)
            }
        }
        
        return resultAttributes
    }
    
    // метод для регулирования позации при скроллинге
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        // точка остановится при скроллинге и спозиционируется наша ячейка
        // чтобы скорректировать точку, нужно получить индекс
        // округляя значение того offset, который к нам прилетел
        let index = round(proposedContentOffset.y / dragOffset)
        // вычисляем offset
        let offset = index * dragOffset
        return CGPoint(x: 0, y: offset)
    }
}
