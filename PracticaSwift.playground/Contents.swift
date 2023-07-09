import Foundation

//: HotelReservationManager

let hotelReservationManager: HotelReservationManagerProtocol = HotelReservationManager()
let clientList = [
    Client(name: "Goku", age: 40, height: 180),
    Client(name: "Krilin", age: 40, height: 160),
]

let reservationAdded = try? hotelReservationManager.addReservation(clientList: clientList, durationOfDays: 10, breakfastOption: true)
reservationAdded
print("Reservation List with newly added reservations \n", hotelReservationManager.allReservations)

let reservationCanceled = try? hotelReservationManager.cancelReservation(byId: reservationAdded?.id ?? .zero)
reservationCanceled
print("Reservation List with empty content, because the only existing reservation was canceled. \n", hotelReservationManager.allReservations)


//: Unit Tests

let hotelReservationTests = HotelReservationManagerTests()
hotelReservationTests.testAddReservation_WithCorrectData_ReservationAddSuccessfully()
hotelReservationTests.testAddReservation_SuccessfullyAddedReservation_TheCorrectReservationPrice()
hotelReservationTests.testAddReservation_EmptyClients_EmptyClientsError()
hotelReservationTests.testAddReservation_DuplicatedClient_DuplicatedClientError()
hotelReservationTests.testCancelReservation_WithCorrectId_ReservationCancelledSuccesfully()
hotelReservationTests.testCancelReservation_WithUnknownId_NotFoundError()
