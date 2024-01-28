//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import Foundation
struct ExperienceModel : Identifiable{
    var id:  String = UUID().uuidString
    var logo : String
    var companyName : String
    var startDate : String
    var endDate : String
    var positions : String
}

