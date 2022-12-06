//
//  HomePageView.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        //our navigation stack controls the navigation heirarchay from our home page
        NavigationStack {
            //this navigationLink is the workout plans on the top of the view,
            //it will navigate to WorkoutPlanView() when clicked
                NavigationLink("Workout Plans")
            {
                WorkoutPlanView()
            }
            .foregroundColor(.black)
            .font(.largeTitle)
            .font(.title2)
            //this list displays our 5 MuscleGroups, with images as well
                List(MuscleGroup.all) { iter in
                    //this navigation link will navigate to workoutView of the corresponding
                    //muscleGroup
                    NavigationLink(value: iter) {
                        Text(iter.name)
                    }
                    // Link to each body part
                    .navigationDestination(for: MuscleGroup.self) { iter in
                        WorkoutView(muscleGroup: iter)
                    }
                    // Itteration for each muscle image
                    Image(iter.image)
                }
        }
        .bold()
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
