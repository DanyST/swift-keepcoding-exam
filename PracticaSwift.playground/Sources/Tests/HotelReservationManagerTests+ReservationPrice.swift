import Foundation

extension HotelReservationManagerTests {
    public func testAddReservation_SuccessfullyAddedReservation_TheCorrectReservationPrice() {
        let hotelReservationManager = HotelReservationManager()
        
        do {
            let priceExpected: Double = 100
            
            let clientList = [
                Client(name: "Goku", age: 40, height: 180),
                Client(name: "Krilin", age: 40, height: 160),
            ]
            let reservationAdded1 = try hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 2, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 1)
            assert(reservationAdded1.price == priceExpected)
            
            let clientList2 = [
                Client(name: "Bulma", age: 40, height: 168),
                Client(name: "Vegeta", age: 40, height: 175),
            ]
            let reservationAdded2 = try hotelReservationManager.addReservation(clientList: clientList2, durationOfDays: 2, breakfastOption: true)
            assert(reservationAdded2.price == priceExpected)
            assert(hotelReservationManager.allReservations.count == 2)
            
            
            let priceExpected2: Double = 360
            
            let clientList3 = [
                Client(name: "Frezzer", age: 100, height: 160),
                Client(name: "Cell", age: 10, height: 180),
                Client(name: "Majin Buu", age: 200, height: 190),
            ]
            let reservationAdded3 = try hotelReservationManager.addReservation(clientList: clientList3, durationOfDays: 6, breakfastOption: false)
            assert(hotelReservationManager.allReservations.count == 3)
            assert(reservationAdded3.price == priceExpected2)
            
            let clientList4 = [
                Client(name: "Son Gohan", age: 17, height: 180),
                Client(name: "Milk", age: 40, height: 175),
                Client(name: "Goten", age: 10, height: 150),
            ]
            let reservationAdded4 = try hotelReservationManager.addReservation(clientList: clientList4, durationOfDays: 6, breakfastOption: false)
            assert(hotelReservationManager.allReservations.count == 4)
            assert(reservationAdded4.price == priceExpected2)
            
            
            let clientList5 = [
                Client(name: "Broly", age: 40, height: 190),
            ]
            let reservationAdded5 = try hotelReservationManager.addReservation(clientList: clientList5, durationOfDays: 4, breakfastOption: true)
            assert(hotelReservationManager.allReservations.count == 5)
            assert(reservationAdded5.price == 100)
            assert(reservationAdded5.price != priceExpected2)
        } catch {
            assertionFailure("This case must not occur")
        }
    }
}
