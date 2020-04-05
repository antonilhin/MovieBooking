//
//  TicketDate.swift
//  MovieBooking
//
//  Created by Antoni on 01/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import Foundation

struct TicketDate: Equatable {
    
    var day: String
    var month: String
    var year: String
    
    static var `default`: TicketDate { TicketDate(day: "", month: "", year: "") }
}
