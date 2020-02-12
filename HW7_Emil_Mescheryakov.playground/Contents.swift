import Foundation

//Это изначальные попытки со сложной структурой, но для экономии времени решил упростить до взаимодействия покупателя с кассой
//struct FuelStation { //АЗС
//    var cashbox: CashBox
//    var refuelingColumn: RefuelingColumn
//}
//class RefuelingColumn { //заправочная колонка
//    enum FuelType {
//        case diesel, gasoline
//    }
//    enum PistolCondition {
//        case hanged, pulledOff
//    }
//
//    var firstFuelType: FuelType //тип топлива для первого пистолета
//    var secondFuelType: FuelType //тип топлива для второго пистолета
//    var twoSided: Bool //расположение пистолетов, если с торца колонки - можно использовать подъезжая с разных сторон, если на лицевой части, то только с одной стороны
//    var pistol: PistolCondition //пистолет снят/повешен
//
//    func supplyFuel(amount: Int) -> String {
//        <#function body#>
//    }
//
//        init(firstFuelType: FuelType, secondFuelType: FuelType, twoSided: Bool, pistol: PistolCondition) {
//        self.firstFuelType = firstFuelType
//        self.secondFuelType = secondFuelType
//        self.twoSided = twoSided
//        self.pistol = pistol
//    }
//}
enum Errors: Error {
    case insufficientFunds, outOfCashInCashbox
}

class Customer {
    var cash: Int
    
    func payTo(_ recipient: CashBox, cost: Int) throws { //может вызвать ошибку если нет денег
        guard cost <= cash else {
            throw Errors.insufficientFunds
        }
        cash -= cost
        return recipient.cash += cost
    }
    
    init(cash: Int) {
        self.cash = cash
    }
}

class  CashBox { //касса
    var cash: Int
    func giveChangeTo(_ customer: Customer, customersMoney: Int, cost: Int) throws { //может вызвать ошибку, если платеж меньше чем стоимость (не хватает средств)
        
        guard customersMoney >= cost else {
            throw  Errors.outOfCashInCashbox
        }
        
        let change = customersMoney - cost
        cash - change
        return customer.cash += change
    }
    
    init(cash: Int) {
        self.cash = cash
    }
}

var customer = Customer(cash: 500)

var cashbox = CashBox(cash: 300)

//do {
//    _ = try customer.payTo(cashbox, cost: 500) //платит в кассу 500 (все свои деньги)
//} catch Errors.insufficientFunds {
//    print("Не хватает денег")
//}
//
//do {
//    _ = try cashbox.giveChangeTo(customer, customersMoney: 500, cost: 300) //магазин вернул сдачу с 500, при стоимости 300
//} catch Errors.outOfCashInCashbox {
//    print("Недостаточно средств в кассе")
//}


cashbox.cash
let pay = try? customer.payTo(cashbox, cost: 300)
cashbox.cash

customer.cash
let giveChange = try? cashbox.giveChangeTo(customer, customersMoney: 300, cost: 100)
customer.cash
