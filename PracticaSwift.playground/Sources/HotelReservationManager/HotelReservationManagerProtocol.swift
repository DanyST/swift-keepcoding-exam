import Foundation

public protocol HotelReservationManagerProtocol {
    @discardableResult func addReservation(clientList: [Client], durationOfDays: Int, breakfastOption: Bool) throws -> Reservation
    @discardableResult func cancelReservation(byId id: Int) throws -> Reservation
    var allReservations: [Reservation] { get }
}
