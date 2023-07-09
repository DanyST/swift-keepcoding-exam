import Foundation

public enum ReservationError: Error {
    case duplicatedReservation
    case duplicatedClient
    case emptyClients
    case notFound
}
