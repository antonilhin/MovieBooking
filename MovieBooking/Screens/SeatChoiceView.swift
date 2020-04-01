//
//  SeatChoiceView.swift
//  MovieBooking
//
//  Created by Antoni on 01/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

struct SeatsChoiceView<T: Movie>: View {
    
    var movie: T
    
    @State private var selectedSeats: [Seat] = []
    @State private var showBasket: Bool = false
    @State private var date: TicketDate = TicketDate.default
    @State private var hour: String = ""
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false ) {
                VStack(spacing: 0) {
                    TheatreView(selectedSeats: self.$selectedSeats).padding(.top, 20)
                    DateTimeView(date: self.$date, hour: self.$hour)
                    LCButton(text: "Continue", action: {}).padding()
                    
                }.navigationBarTitle("Choose seats", displayMode: .large)
                    .frame(maxHeight: .infinity)
                    .accentColor(Color.accent)
            }
        }
    }
    
}
