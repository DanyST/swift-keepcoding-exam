# Keepcoding FullStack Mobile Apps Bootcamp XVI Edition: Swift Exam

## Description
Hotel Luchadores Reservation Management

## Requirements

* Model the structs: _Client_, _Reservation_, and _ReservationError_.

    * Client: name, age, height (cm).
    * Reservation: unique ID, hotel name, list of clients, duration 
    (days), price, breakfast option (true/false).
    * ReservationError: An enum that implements Error with three possible 
    errors (cases): duplicate reservation ID found, reservation found for a 
    client, and reservation not found.


* Manage the reservations with the class HotelReservationManager.
    * Create a list to store reservations.
    * Create a method to add a reservation. Add a reservation with the 
    following parameters: list of clients, duration, breakfast option. Assign 
    a unique ID (you can use a counter, for example), calculate the price, and 
    add the hotel name.
    * Verify that the reservation is unique by ID and client before adding 
    it to the list. If it's not valid, throw or return the corresponding 
    ReservationError. There should not be another reservation with the same 
    ID, and no client should have a matching reservation.
    * The price calculation is as follows: number of clients * base price 
    per client (e.g., 20 euros) * days in the hotel * 1.25 if they have 
    breakfast or 1 if they don't. Example: 3 (clients) * 20 euros (base price) 
    * 2 (days in hotel) * 1.25 (because they have breakfast) = 3 * 20 * 2 * 
    1.25 = 150.
    * Add the reservation to the list of reservations.
    * Return the reservation.
* Create a method to cancel a reservation. Cancel the reservation given 
its ID and throw a ReservationError if it doesn't exist. To cancel a 
reservation, simply remove it from the list of reservations based on its 
ID.
* Create a method (or read-only property) to get a list of all current 
reservations.

## Unit Tests

To test your own code, create the following functions and execute them in 
the Playground:

* _testAddReservation_: Verify errors when adding duplicate reservations 
(by ID or if another client is already in another reservation) and ensure 
that new reservations are added correctly.
* _testCancelReservation_: Verify that reservations are canceled correctly 
(removed from the list) and that canceling a non-existent reservation 
results in an error.
* _testReservationPrice_: Ensure that the system calculates prices 
consistently. For example, if you make two reservations with the same 
parameters except for the names of the clients, they should give you the 
same price.
