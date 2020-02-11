import UIKit

protocol SongsContainable {
    var songsAmount: Int { get set }
}

protocol ArtistListable: SongsContainable {
    var artist: String { get set }
}

class Disk: SongsContainable, ArtistListable { //обычный диск с альбомом и песнями музыкантов
    
    enum DiskType {
        case CD, CD_RW, CD_R, DVD, DVD_R
    }
    
    var artist: String
    var album: String
    var songsAmount: Int
    var type: DiskType
    
    init(artist: String, album: String, songsAmount: Int, type: DiskType) {
        self.artist = artist
        self.album = album
        self.songsAmount = songsAmount
        self.type = type
    }
}

struct Stack<T: ArtistListable> { //ДЗ 1. ArtistListable наследует свойство songsAmount от протокола SongsContainable. Эта логика немного неверная, но другого решения я не нашел. Можно было создать общий протокол с двумя свойствами, сделать расширение для одного из протоколов или обойтись без одного из протоколов, как вариант
    private var elements: [T] = []
    
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeLast()
    }
    var totalSongsInStack: Int { //подсчет общего количества песен в стеке. Берет songsAmount из каждого элемента стека и прибавляет в amount
        var amount = 0
        for element in elements {
            amount += element.songsAmount
        }
        return amount
    }
    
    func isStack(closure: (Int) -> Bool) { //ДЗ 2
        var counter = 0
        for element in elements {
            counter += element.songsAmount
        }
        switch closure(counter) {
        case true:
            print("Stack have less than five songs")
        case false:
            print("Stack have more than five songs")
        }
    }
    subscript(element: Int) -> [T]? { //ДЗ №3
        guard elements.count >= element else { return nil }
        return (elements[element] as! [T])
    }
    
    subscript( indexes: Int ...) -> String { // сабскрипт считает сколько существующих элементов (дисков) введено в квадратных в скобках (не знаю зачем это нужно считать)
        var counter = 0
        for index in indexes where index <= self.elements.count {
            counter += 1
        }
        return "Sample have \(counter) elements"
    }
}



var stackOfDisk = Stack<Disk>()
var stingNLTS = Disk(artist: "Sting", album: "Nothing Like The Sun", songsAmount: 7, type: .CD_R)
var xAmbassadorsVHS2 = Disk(artist: "X Ambassadors", album: "VHS 2.0", songsAmount: 18, type: .CD_R)
var coldplayAHFOD = Disk(artist: "Coldplay", album: "A head full of dreams", songsAmount: 11, type: .CD_R)

stackOfDisk.push(stingNLTS)
stackOfDisk.push(coldplayAHFOD)
stackOfDisk.push(xAmbassadorsVHS2)

stackOfDisk.totalSongsInStack

let lessThanFive: (Int) -> Bool = {(element: Int) -> Bool in
   return element < 5
}

stackOfDisk.isStack(closure: lessThanFive) //если поменять количество песен в stingNLTS, xAmbassadorsVHS2, coldplayAHFOD пишет "Stack have less than five songs" - функция работает (надеюсь правильно сделал функцию высшего порядка)

stackOfDisk[5]
stackOfDisk[0, 1, 5]
stackOfDisk[0,1]
