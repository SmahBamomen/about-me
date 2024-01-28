//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import Foundation

struct ProfileModel : Identifiable{
    var id:  String = UUID().uuidString
    var aboutMe : String
    var email : String
    var githubLink : String
    var phoneNum : String
    var linkedin : String
}

