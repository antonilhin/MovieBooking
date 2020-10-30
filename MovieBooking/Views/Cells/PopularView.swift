//
//  PopularView.swift
//  MovieBooking
//
//  Created by Antoni on 30/10/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularView: View {
    
    var movie: MovieViewModel
    
    var body: some View {
        VStack( alignment: .leading, spacing: 0) {
            
            KFImage(source: .network(movie.posterUrl)).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 225, alignment: .center)
                .cornerRadius(20)
                .clipped()
                .padding(.top, 5)
            
            
            Text(movie.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.all, 10)
        }.frame(width: 150)
        
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(movie:  MovieViewModel.default)
    }
}
