import Foundation

extension HotelReservationManagerTests {
    
    public func testAddReservation_WithCorrectData_ReservationAddSuccessfully() {
        let hotelReservationManager = HotelReservationManager()
        
        do {
            assert(hotelReservationManager.allReservations.count == .zero)
            
            let clientList = [
                Client(name: "Goku", age: 40, height: 180),
                Client(name: "Krilin", age: 40, height: 160),
            ]
            let reservationAdded1 = try hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 2, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            assert(reservationAdded1.clientList.count == clientList.count)
            assert(reservationAdded1.clientList == clientList)
            assert(reservationAdded1.durationOfDays == 2)
            assert(reservationAdded1.breakfastOption == true)
            assert(reservationAdded1.price == 100)
            assert(reservationAdded1.id == hotelReservationManager.allReservations[0].id)
            
            let reservationsByIdAdded = hotelReservationManager.allReservations.filter({ $0.id == reservationAdded1.id })
            assert(reservationsByIdAdded.count == 1)
            
            let clientList2 = [
                Client(name: "Bulma", age: 40, height: 168),
                Client(name: "Vegeta", age: 40, height: 175),
            ]
            let reservationAdded2 = try hotelReservationManager.addReservation(clientList: clientList2, durationOfDays: 1, breakfastOption: false)
            assert(hotelReservationManager.allReservations.count == 2)
            assert(reservationAdded2.clientList.count == clientList2.count)
            assert(reservationAdded2.clientList == clientList2)
            assert(reservationAdded2.durationOfDays == 1)
            assert(reservationAdded2.breakfastOption == false)
            assert(reservationAdded2.price == 40)
            assert(hotelReservationManager.allReservations.contains { $0.id == reservationAdded2.id })
            let reservationsByIdAdded2 = hotelReservationManager.allReservations.filter({ $0.id == reservationAdded2.id })
            assert(reservationsByIdAdded2.count == 1)
        } catch {
            assertionFailure("This case must not occur")
        }
    }
    
    
    public func testAddReservation_EmptyClients_EmptyClientsError() {
        let hotelReservationManager = HotelReservationManager()
        
        do {
            assert(hotelReservationManager.allReservations.count == .zero)
            
            try hotelReservationManager.addReservation(clientList: [], durationOfDays: 2, breakfastOption: true)
            assertionFailure("This case must not occur")
        } catch {
            assert(hotelReservationManager.allReservations.count == .zero)
            
            let reservationError = error as? ReservationError
            assert(reservationError == .emptyClients)
        }
    }
    
    public func testAddReservation_DuplicatedClient_DuplicatedClientError() {
        let hotelReservationManager = HotelReservationManager()
        
        do {
            assert(hotelReservationManager.allReservations.count == .zero)
            
            let clientList = [
                Client(name: "Goku", age: 40, height: 180),
                Client(name: "Krilin", age: 40, height: 160),
            ]
            
            try hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 2, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            
            let clientList2 = [
                Client(name: "Goku", age: 40, height: 180),
                Client(name: "Vegeta", age: 40, height: 175),
            ]
            
            try hotelReservationManager.addReservation(clientList: clientList2, durationOfDays: 2, breakfastOption: true)
            assertionFailure("This case must not occur")
        } catch {
            assert(hotelReservationManager.allReservations.count == 1)
            
            let reservationError = error as? ReservationError
            assert(reservationError == .duplicatedClient)
        }
    }
}
