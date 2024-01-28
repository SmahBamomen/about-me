//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct MyProjectsView: View {
 
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 25) {
                        AllProjects().padding(.horizontal)
                          
                    } 
                    
                }
     
    }
}

