//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct AllProjects: View {
    @ObservedObject  var projectsData = FirebaseManager()
    var body: some View {
        ForEach(projectsData.projectsModel) {
            info in
            NavigationLink(destination: ProjectDetails(info: info)) {
                VStack{
                    ImageLoading(imageURL: info.appLogo,imageWidth: 110,imageHeight: 100).background(RoundedRectangle(cornerRadius: 4.0))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                    Text(info.projectName).font(.subheadline).fontWeight(.medium).foregroundColor(.black)
                       
                } .frame(width: 130, height: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 1, style: .continuous).fill(Color(hue: 0.619, saturation: 0.009, brightness: 0.939)))
               
                
            }
           
        }
    }
}

struct SeeAllProjects_Previews: PreviewProvider {
    static var previews: some View {
        AllProjects()
    }
}
