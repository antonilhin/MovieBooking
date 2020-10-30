//
//  UpcomingView.swift
//  MovieBooking
//
//  Created by Antoni on 30/10/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct UpcomingView: View {
    
    var movie: MovieViewModel
    
    var body: some View {
        HStack{
            KFImage(source: .network(movie.backdropUrl)).resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
            
            VStack(alignment: .leading) {
                Text(movie.title).font(.title).bold()
                Text(movie.releaseDate)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(movie: MovieViewModel.default)
    }
}
