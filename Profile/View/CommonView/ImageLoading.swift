//
//  ContentView.swift
//  Profile
//
//  Created by Samah Bamumin on 13/07/1445 AH.
//

import SwiftUI

struct ImageLoading: View {
    let imageURL : String
    let imageWidth : Double
    let imageHeight : Double
    var body: some View {
        AsyncImage(url: URL(string: imageURL), transaction: .init(animation: .spring(response: 1.6))) { phase in
                   switch phase {
                   case .empty:
                       ProgressView()
                           .progressViewStyle(.circular)
                   case .success(let image):
                       image
                           .resizable().frame(width: imageWidth, height: imageHeight)
                           .aspectRatio(contentMode: .fill)
                   case .failure:
                       Text("Failed fetching image. Make sure to check your data connection and try again.")
                           .foregroundColor(.red)
                   @unknown default:
                       Text("Unknown error. Please try again.")
                           .foregroundColor(.red)
                   }
               }
    }
}

