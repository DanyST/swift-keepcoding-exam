import Foundation

//: HotelReservationManager
let hotelReservationManager: HotelReservationManagerProtocol = HotelReservationManager()
let clientList = [
    Client(name: "Goku", age: 40, height: 180),
    Client(name: "Krilin", age: 40, height: 160),
]

let reservationAdded = try? hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 10, breakfastOption: true)
reservationAdded
hotelReservationManager.allReservations

let reservationCanceled = try? hotelReservationManager.cancelReservation(byId: reservationAdded!.id)
reservationCanceled
hotelReservationManager.allReservations



//: Tests
let hotelReservationTests = HotelReservationManagerTests()
hotelReservationTests.testAddReservation_WithCorrectData_ReservationAddSuccessfully()
hotelReservationTests.testAddReservation_SuccessfullyAddedReservation_TheCorrectReservationPrice()
hotelReservationTests.testAddReservation_EmptyClients_EmptyClientsError()
hotelReservationTests.testAddReservation_DuplicatedClient_DuplicatedClientError()
hotelReservationTests.testCancelReservation_WithCorrectId_ReservationCancelledSuccesfully()
hotelReservationTests.testCancelReservation_WithUnknownId_NotFoundError()
