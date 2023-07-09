import Foundation

extension HotelReservationManagerTests {
    public func testCancelReservation_WithCorrectId_ReservationCancelledSuccesfully() {
        let hotelReservationManager = HotelReservationManager()
        
        do {
            assert(hotelReservationManager.allReservations.count == .zero)
            
            let clientList = [
                Client(name: "Goku", age: 40, height: 180),
                Client(name: "Krilin", age: 40, height: 160),
            ]
            let reservationAdded1 = try hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 2, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            
            let reservationCancelled1 = try hotelReservationManager.cancelReservation(byId: reservationAdded1.id)
            assert(reservationAdded1 == reservationCancelled1)
            assert(hotelReservationManager.allReservations.count == .zero)
            
            let clientList2 = [
                Client(name: "Bulma", age: 40, height: 168),
                Client(name: "Vegeta", age: 40, height: 175),
            ]
            let reservationAdded2 = try hotelReservationManager.addReservation(clientList: clientList2, durationOfDays: 1, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            
            let reservationCancelled2 = try hotelReservationManager.cancelReservation(byId: reservationAdded2.id)
            assert(reservationAdded2 == reservationCancelled2)
            assert(hotelReservationManager.allReservations.count == .zero)
        } catch {
            assertionFailure("This case must not occur")
        }
    }
    
    public func testCancelReservation_WithUnknownId_NotFoundError() {
        let hotelReservationManager = HotelReservationManager()
        
        let clientList = [
            Client(name: "Goku", age: 40, height: 180),
            Client(name: "Krilin", age: 40, height: 160),
        ]
        
        do {
            try hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 2, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            
            try hotelReservationManager.cancelReservation(byId: 9289289)
            assertionFailure("This case must not occur")
        } catch {
            assert(hotelReservationManager.allReservations.count == 1)
            
            let reservationError = error as? ReservationError
            assert(reservationError == .notFound)
        }
    }
}
