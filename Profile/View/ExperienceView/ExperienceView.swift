//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct ExperienceView: View {
    @ObservedObject  var experienceData = FirebaseManager()
    var body: some View {
        ForEach(experienceData.experienceModel){
            info in
            VStack(alignment: .leading){
                HStack{
                    Spacer().frame(width: 15)
                    ImageLoading(imageURL: info.logo,imageWidth: 120 , imageHeight: 110)

                    Spacer().frame(width: 15)
                    VStack(alignment: .leading,spacing: 6){
                        Text(info.companyName).font(.body).fontWeight(.medium).background(
                          RoundedRectangle(cornerRadius: 1, style: .continuous).fill(Color(red: 0.9137254901960784, green: 0.9215686274509803, blue: 0.9411764705882353)))
                        Text(info.positions).font(.subheadline).fontWeight(.medium)
                        HStack{
                            Text("Start Date : ").font(.caption2)
                            Text(info.startDate).font(.caption2)
                        }
                        HStack{
                            Text("End Date : ").font(.caption2)
                            Text(info.endDate).font(.caption2)
                        }
                        Spacer().frame(width: 35)
                    }
                    
                }
                Spacer().frame(height: 10)
                Divider()
            }
        }
   
        
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView()
    }
}
