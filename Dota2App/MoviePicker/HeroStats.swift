//
//  HeroStats.swift
//  MoviePicker
//
//  Created by Test on 11/05/2020.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let base_health: Int
    let base_mana: Int
    let base_attack_max: Int
    let img: String
}


