//
//  ActorDetailView.swift
//  MovieBooking
//
//  Created by Antoni on 29/03/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

struct ActorDetailView: View {
    
    var actor: Actor
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(uiImage: UIImage(named: actor.image) ?? UIImage() )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(actor.name)
                    .font(.system(size: 35, weight: .black, design: .rounded))
                    .padding(.horizontal)
                Text(actor.bio)
                    .font(.body)
                    .padding()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(actor:  Actor.default)
    }
}
