//
//  WorkoutView.swift
//  GymBros+
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/3/22.
//

import SwiftUI

struct WorkoutView: View {
    // linking MuscleGroup from model to new variable called muscleGroup
    var muscleGroup: MuscleGroup
    var body: some View {
        // List of workouts from each type of body part
        List(muscleGroup.workouts) {
        // itterate throughout each workout name
         iter in
            NavigationLink(value: iter) {
                Text(iter.name)
            }
            // itterate through each workout, and when clicked, goes to description view of each workout
            .navigationDestination(for: WorkoutModel.self) { iter in
                DescriptionView(workoutSpecific: iter)
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WorkoutView(muscleGroup: MuscleGroup.all[0])
        }
    }
}
