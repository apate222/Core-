//
//  ContentView.swift
//  FitnessApp
//
//  Created by Avi Patel on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    
    let workouts = workoutData
    
    var body: some View {
        //Z stack - where objects are stacked hortizontally
        NavigationView {
            
            VStack(alignment: .leading) {
                
                // Main Card View
                ZStack {
                    Image("fitness workout")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                    
                    
                    //vertical stack - where objects are stacked vertically
                    VStack {
                        
                        Spacer()
                        
                        Text("Full Body Workout")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        Text("For Beginners")
                            .fontWeight(.regular)
                            .foregroundColor(.purple)
                    }
                    .padding()
                    .frame(width: 380)
                    .background(Color(.clear))
                }
                .frame(width: 380, height: 300)
                .cornerRadius(20)
                .clipped()
                .shadow(radius: 8)
                .padding()
                
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding()
                
                // Stack where the inner elements are arranged/stacked horizontally
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 30) {
                        // itteration for the 5 cards "workout"
                        ForEach(workouts) { workout in
                            
                            
                            // day card
                            // Links to new page called "WorkoutDetailView" which will help us expand the cards into more information
                            NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                VStack {
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 1500, height: 115)
                                    
                                    //vertical stack - where objects are stacked vertically
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Text(workout.day)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        Text(workout.bodyPart)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(width: 150)
                                    .background(Color(.clear))
                                }
                                .frame(width: 150, height: 180)
                                .clipped()
                                .cornerRadius(20)
                            .shadow(radius: 8)
                            }
                        }
                    }
                    .padding()
                }
                .offset(x: 0, y: -15)
                
                Spacer()
            }
            .navigationTitle("Home Workouts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Workout: Identifiable {
    // variable ID is set to a method UUID() which creates unique identifiers
    // var is used because it is indicative of some data thtat will be changed over time
    var id = UUID()
    // variable names with their respected data types
    var day: String
    var bodyPart: String
    var image: String
    var routine: [String]
}

// array of all the workout days
// let is indicative of some data that will not be changing, let is better to be used when the data is already set to their values, like shown below
let workoutData = [
    Workout(day: "Monday", bodyPart: "Leg", image: "leg", routine: ["Warmup", "Leg Press", "Squats", "Leg extension", "Hamstring curls"]),
    Workout(day: "Tuesday", bodyPart: "Chest", image: "chest", routine: ["Warmup", "DB chest press", "Incline DB press", "DB flys", "Cable flys"]),
    Workout(day: "Wednesday", bodyPart: "Back", image: "back", routine: ["Warmup", "Pull ups", "Row machine", "Deadlifts", "Lat pull down"]),
    Workout(day: "Thursday", bodyPart: "Shoulder", image: "shoulder", routine: ["Warmup", "DB shoulder press", "Shoulder machine", "Cable lateral raises", "Cable horizonal raise"]),
    Workout(day: "Friday", bodyPart: "Leg", image: "leg", routine: ["Warmup", "Leg Press", "Squats", "Leg extension", "Hamstring curls"])
]
