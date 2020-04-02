//
//  AnyTransitionExt.swift
//  MovieBooking
//
//  Created by Antoni on 02/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var hearbeat: AnyTransition {
        return AnyTransition.scale(scale: 1.7).combined(with: .scale(scale: 1))
    }
}
