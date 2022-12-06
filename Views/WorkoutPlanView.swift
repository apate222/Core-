//
//  WorkoutPlanView.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI

struct WorkoutPlanView: View {
    var body: some View {
        NavigationStack {
            VStack{
                //each navigation link here represents the buttons in the View
                // for each workout plan
                //each navigation link will navigate to ListView, while passing the
                //appropriate array of workouts of the appropriate muscle group.
                NavigationLink("Legs Workout Plan") {
                    ListView(muscleGroup: MuscleGroup.all[0])
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                NavigationLink("Chest Workout Plan") {
                    ListView(muscleGroup: MuscleGroup.all[1])
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                NavigationLink("Back Workout Plan") {
                    ListView(muscleGroup: MuscleGroup.all[2])
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                NavigationLink("Shoulders Workout Plan") {
                    ListView(muscleGroup: MuscleGroup.all[3])
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                NavigationLink("Arms Workout Plan") {
                    ListView(muscleGroup: MuscleGroup.all[4])
                }
                .padding()
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
            }
            .padding(60)
            Spacer()
        }
    }
}

struct WorkoutPlanView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlanView()
    }
}
