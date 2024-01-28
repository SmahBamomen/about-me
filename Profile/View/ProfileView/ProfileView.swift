//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    @Binding var showProfile:Bool
    
    
    @ObservedObject  var profileData = FirebaseManager()
    var body: some View {
        VStack{
            Spacer()
            Image("memoji").resizable().frame(width: 200, height: 230)
            Text(profileData.profileModel.aboutMe ).font(.footnote)
                .fontWeight(.medium)
                .padding([.leading, .bottom, .trailing])
         
           Spacer()
            HStack{
           
                if let gitHubURL = URL(string:profileData.profileModel.githubLink) {
                    Link(destination: gitHubURL) {
                        HStack {
                            Image(systemName: "link")
                                .foregroundColor(.blue)
                                .imageScale(.medium)
                            Text("GitHub")
                                .foregroundColor(.blue)
                                .font(.body)
                        }
                      
                    }
                } else {
                    Text("Invalid GitHub URL")
                }
                Text("|")
                if let gitLinkedIn = URL(string:profileData.profileModel.linkedin) {
                    Link(destination: gitLinkedIn) {
                        HStack {
                            Image(systemName: "link")
                                .foregroundColor(.blue)
                                .imageScale(.medium)
                            Text("Linkedin")
                                .foregroundColor(.blue)
                                .font(.body)
                        }
                      
                    }
                } else {
                    Text("Invalid Linkedin URL")
                }
              Text("|")
                Button(action: {
                    let phone = "tel://"
                    let phoneNumberformatted = phone + profileData.profileModel.phoneNum
                    guard let url = URL(string: phoneNumberformatted) else { return }
                    UIApplication.shared.open(url)
                   }) {
                    Image(systemName: "phone")
                   
                }
                Text("|")
                Button(action: {
                    let url = URL(string: "message://")
                       if let url = url {
                           if UIApplication.shared.canOpenURL(url) {
                               UIApplication.shared.open(url, options: [:], completionHandler: nil)
                           }
                       }

                        }) {
                            Image(systemName: "square.and.pencil")
                        }
               
            
                }
              
            }
      
            
            
        }
    }

