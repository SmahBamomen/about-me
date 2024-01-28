//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import Foundation
import Firebase
class FirebaseManager : ObservableObject {

    @Published var profileModel = ProfileModel(aboutMe: "", email: "", githubLink: "", phoneNum: "", linkedin: "")
    @Published var projectsModel = [ProjectsModel]()
    @Published var experienceModel = [ExperienceModel]()
    let db = Firestore.firestore()
    init() {
        fetchProfileInfo()
        fetchExperienceInfo()
        fetchProjectsInfo()
    }
    
    // Function to get all profile information from firebase
    func fetchProfileInfo(){
   
        let docRef = db.collection("profile").document("GE2KMysAkyZh6IuLmMYR")

          docRef.getDocument { (document, error) in
              guard error == nil else {
                  print("error", error ?? "")
                  return
              }

              if let document = document, document.exists {
                  let data = document.data()
                  if data != nil {
                      
                      let data = document.data()
                      self.profileModel.aboutMe = data?["aboutMe"] as? String ?? ""
                      self.profileModel.email = data?["email"] as? String ?? ""
                      self.profileModel.githubLink = data?["githubLink"] as? String ?? ""
                      self.profileModel.phoneNum = data?["phoneNum"] as? String ?? ""
                      self.profileModel.linkedin = data?["linkedin"] as? String ?? ""
                      
                
     
                  }
              }

          }
              

          }
    
    // Function to get all projects information from firebase
    func fetchProjectsInfo(){
        db.collection("projects").getDocuments() { (querySnapshot, error) in
                   if let error = error {
                           print("Error getting documents: \(error)")
                   } else {
                           for document in querySnapshot!.documents {
       
                               let data = document.data()
                               
                               let appLogo = data["appLogo"] as? String ?? ""
                               let imageURL = data["imageURL"] as? String ?? ""
                               let projectDescription = data["projectDescription"] as? String ?? ""
                               let projectName = data["projectName"] as? String ?? ""
                               let teamNames = data["teamNames"] as? String ?? ""
                               let tools = data["tools"] as? String ?? ""
                               self.projectsModel.append(ProjectsModel(appLogo: appLogo, imageURL: imageURL, projectDescription: projectDescription, projectName: projectName, teamNames: teamNames, tools: tools))
       
       
                           }
                   }
       }
    }
    
    // Function to get all experience information from firebase
    func fetchExperienceInfo(){
        db.collection("experience").getDocuments() { (querySnapshot, error) in
                   if let error = error {
                           print("Error getting documents: \(error)")
                   } else {
                           for document in querySnapshot!.documents {
       
                               let data = document.data()
                               let companyName = data["companyName"] as? String ?? ""
                               let endDate = data["endDate"] as? String ?? ""
                               let logo = data["logo"] as? String ?? ""
                               let positions = data["positions"] as? String ?? ""
                               let startDate = data["startDate"] as? String ?? ""
                               self.experienceModel.append(ExperienceModel(logo: logo, companyName: companyName, startDate: startDate, endDate: endDate, positions: positions))
       
       
                           }
                   }
       }
    }
}
