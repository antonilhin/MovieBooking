//
//  Seat.swift
//  MovieBooking
//
//  Created by Antoni on 01/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
