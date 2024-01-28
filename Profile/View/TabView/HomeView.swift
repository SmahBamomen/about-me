//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: String? = nil
    @State private var showProfile: Bool = false

    @ObservedObject  var profileData = FirebaseManager()
      var body: some View {
          
          NavigationView {
              ScrollView{
                  VStack {
                      HStack{
                            Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFit()   .padding(.leading)
                                    .frame(width: 40, height: 40)
                          Text("About Me").font(.headline)
                          Spacer()
                            
                      }.onTapGesture {
                          self.showProfile.toggle()
                        
                      }
                   
                      .sheet(isPresented: self.$showProfile) {
                          ProfileView(showProfile: $showProfile)
                     }
                      HStack{
                          Text("My Projects").font(.headline)
                          Spacer()
                          NavigationLink(destination: MyProjectsView()) {
                          Text("See all")
                              .foregroundColor(Color(red: 0.12156862745098039, green: 0.7450980392156863, blue: 0.7490196078431373)).bold()
                              
                          }
                          
                      }.padding([.top, .leading, .trailing])
                        
                     
                      ScrollView(.horizontal, showsIndicators: false) {
                          HStack(spacing: 10) {
                              Spacer()
                              AllProjects()
                          }
                      }
                      Spacer()
                  }
                  Spacer()
                  HStack{
                      Text("Experience").font(.headline).padding(.leading)
                      Spacer()
                  }
                 
                  ExperienceView()
              }
            
             
                
              .navigationTitle("Samah Bamumin")
          }
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
