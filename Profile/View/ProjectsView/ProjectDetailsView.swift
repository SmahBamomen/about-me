//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct ProjectDetails: View {
    let info: ProjectsModel
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 15){
            
                ImageLoading(imageURL: info.imageURL,imageWidth: 300 ,imageHeight: 250)
                    .padding(.horizontal)
                Text(info.projectName)
                    .font(.headline)
                    .fontWeight(.heavy)
                
                Text(info.projectDescription)
                    .font(.footnote)
                    .fontWeight(.medium)
                HStack{
                    Text("Tools : ")   .font(.headline)
                        .fontWeight(.heavy)
                    Text(info.tools) .font(.footnote)
                        .fontWeight(.medium)
                }
                Spacer()
                Text("© 2022 \(info.teamNames)")
                    .font(.caption)
                    .fontWeight(.thin)  .multilineTextAlignment(.leading)
            }
            .padding(.leading)
        }
        
    }
}


