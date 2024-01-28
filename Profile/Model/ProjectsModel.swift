//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import Foundation

struct ProjectsModel : Identifiable{
    var id:  String = UUID().uuidString
    var appLogo : String
    var imageURL : String
    var projectDescription : String
    var projectName : String
    var teamNames : String
    var tools : String
}
