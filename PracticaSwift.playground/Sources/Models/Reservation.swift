import Foundation

public struct Reservation {
    public let id: Int
    public let name: String
    public let clientList: [Client]
    public let durationOfDays: Int
    public let price: Double
    public let breakfastOption: Bool
    
    public init(id: Int, name: String, clientList: [Client], durationOfDays: Int, price: Double, breakfastOption: Bool) {
        self.id = id
        self.name = name
        self.clientList = clientList
        self.durationOfDays = durationOfDays
        self.price = price
        self.breakfastOption = breakfastOption
    }
}

extension Reservation: Hashable, Equatable {}

extension Reservation: Comparable {
    public static func < (lhs: Reservation, rhs: Reservation) -> Bool {
        lhs.id < rhs.id
    }
}
