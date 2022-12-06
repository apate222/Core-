//
//  DescriptionView.swift
//  GymBros+
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/3/22.
//

import SwiftUI

// UI to create gray background
let backgroundgradient = LinearGradient(colors: [Color.gray, Color.gray], startPoint: .top, endPoint: .bottom)

struct DescriptionView: View {
 //   @State private var total = 0
    // Pulling data from the model file
    var workoutSpecific: WorkoutModel
    var body: some View {
        // vertical view
        ZStack {
            // gray background
            backgroundgradient
            VStack {
                // formatting to show image, name of workout, type of workout, and description in a vertical view
                Image(workoutSpecific.image)
                    .padding(30)
                Text(workoutSpecific.name)
                    .font(.largeTitle)
                    .padding(5)
                Text(workoutSpecific.weightType)
                    .font(.headline)
                    .padding(5)
                Text(workoutSpecific.description)
                    .padding(10)
                // button to implement favorite tab
            }

        }
        // gets rid of white space at the top and bottom
        .ignoresSafeArea()
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(workoutSpecific: WorkoutModel.defaultWorkoutList[0])
    }
}
