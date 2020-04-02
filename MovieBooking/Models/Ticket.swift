//
//  Ticket.swift
//  MovieBooking
//
//  Created by Antoni on 02/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import Foundation

struct Ticket<T: Movie>: Identifiable {
    var id: UUID
    var movie: T
    var date: TicketDate
    var hour: String
    
    static var `default`: Ticket<Popular>{
        .init(id: UUID(), movie: Popular.default, date: TicketDate.default, hour: "")
    }
}
