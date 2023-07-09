import Foundation

public class HotelReservationManager: HotelReservationManagerProtocol {
    private enum Constants {
        static let hotelName = "Hotel Luchadores"
        static let basePriceClient: Double = 20
        static let breakfastRate: Double = 1.25
        static let NotbreakfastRate: Double = 1
    }
    
    private var reservations = Set<Reservation>()
    
    public init() {}
    
    public var allReservations: [Reservation] {
        reservations.sorted(by: >)
    }
    
    @discardableResult
    public func addReservation(clientList: [Client], durationOfDays: Int, breakfastOption: Bool) throws -> Reservation {
        guard !clientList.isEmpty,
              let price = calculateTotalPrice(clientCount: clientList.count, durationOfDays: durationOfDays, breakfastOption: breakfastOption)
        else {
            throw ReservationError.emptyClients
        }
        
        let id = reservations.count + 1
        
        let newReservation = Reservation(
            id: id,
            name: Constants.hotelName,
            clientList: clientList,
            durationOfDays: durationOfDays,
            price: price,
            breakfastOption: breakfastOption
        )
        
        try validateNewReservation(newReservation)
        
        reservations.insert(newReservation)
        return newReservation
    }
    
    @discardableResult
    public func cancelReservation(byId id: Int) throws -> Reservation {
        guard let reservationToCancel = reservations.first(where: { $0.id == id }) else {
            throw ReservationError.notFound
        }
        reservations.remove(reservationToCancel)
        return reservationToCancel
    }
}

private extension HotelReservationManager {
    func validateNewReservation(_ newReservation: Reservation) throws {
        if !reservations.isEmpty {
            let isReservationExisting = reservations.contains { $0.id == newReservation.id }
            if isReservationExisting {
                throw ReservationError.duplicatedReservation
            }
            
            let isClientExistingInOtherReservation = reservations.contains { reservationStored in
                return newReservation.clientList.contains { newClient in
                    return reservationStored.clientList.contains(newClient)
                }
            }
            
            if isClientExistingInOtherReservation {
                throw ReservationError.duplicatedClient
            }
        }
    }
    
    func calculateTotalPrice(clientCount: Int, durationOfDays: Int, breakfastOption: Bool) -> Double? {
        guard clientCount > 0 else { return nil }
        let breakfastRate = breakfastOption ? Constants.breakfastRate : Constants.NotbreakfastRate
        let price = Double(clientCount) * Constants.basePriceClient * Double(durationOfDays) * breakfastRate
        return price
    }
}
