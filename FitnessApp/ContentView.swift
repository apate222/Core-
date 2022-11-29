//
//  ContentView.swift
//  FitnessApp
//
//  Created by Avi Patel on 11/21/22.
//

import SwiftUI

@main
struct CorePlus: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    
    let workouts = workoutData
    
    var body: some View {
        
        // user input

        
        
        //Z stack - where objects are stacked hortizontally
        NavigationView {
            
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: true) {
                // Main Card View
                /*ZStack {
                    Image("fitness workout")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                    
                    
                    //vertical stack - where objects are stacked vertically
                        VStack {
                            
                            Spacer()
                            
                            Text("Full Body Exercises")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
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
                
                Text("Body Parts")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding()
                */
                // Stack where the inner elements are arranged/stacked horizontally
                
                    VStack(spacing: 20) {
                        // itteration for the 5 cards "workout"
                        ForEach(workouts) { workout in
                            
                            
                            // day card
                            // Links to new page called "WorkoutDetailView" which will help us expand the cards into more information
                            NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                VStack {
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 380, height: 115)
                                    
                                    //vertical stack - where objects are stacked vertically
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Text(workout.bodyPart)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(height: 10)
                                    .background(Color(.clear))
                                }
                                .frame(width: 380, height: 180)
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
            .navigationTitle("My Core+")
            .font(.largeTitle)
            .frame(width: 1500)
            .fontWeight(.bold)
            
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
    var bodyPart: String
    var image: String
    var home: [String]
    var machine: [String]
    var free: [String]
}

// array of all the workout days
// let is indicative of some data that will not be changing, let is better to be used when the data is already set to their values, like shown below
let workoutData = [
    Workout(bodyPart: "Legs", image: "leg", home: ["Squat", "Forward Lunge", "Backward Lunge", "Wall Sit", "Speed Skaters"], machine: ["Leg Press", "Leg Extension", "Leg Curl", "Calf Raise", "Hip Abductor"], free: ["Weighted Squat", "Bulgarian Squat", "Hip Raise", "Romanian Deadlift", "Weighted Lunge"]),
    Workout(bodyPart: "Chest", image: "chest", home: ["Pushup", "Incline Pushup", "Decline Pushup", "Diamond Pushup", "Wide Pushup"], machine: ["Chest Press", "Chest Flies", "Vertical Cable Flies", "Horizontal Cable Flies", "Seated Cable Press"], free: ["Bench Press", "Dumbell Chest Press", "Incline Bench Press", "Dumbell Flies", "Plate Press"]),
    Workout(bodyPart: "Back", image: "back", home: ["Pullups", "Chinups", "Weighted Pullup", "Superman", "Back Extension"], machine: ["Lat Pulldown", "Seated Row", "Rear Delt Flies", "Back Extension", "T Bar Row"], free: ["Bent Over Row", "Incline Row", "Upright Row", "Good Morning", "Rack Pull"]),
    Workout(bodyPart: "Shoulder", image: "shoulder", home: ["Pipe Pushups", "Shoulder Taps", "Arm Circles"], machine: ["Face Pull", "Reverse Fly", "Machine Shoulder Press"], free: ["Arnold Press", "Front Raise", "Lateral Raise", "Overhead Press", "Shrug"]),
    Workout(bodyPart: "Arms", image: "bicep curls", home: ["Tricep Dip", "Tricep Pushup", "Hand Walk", "Crabwalk", "Inchworm"], machine: ["Preacher Curl", "Tricep Extension", "Cable Kickback"], free: ["Bicep Curl", "Hammer Curl", "Skullcrusher", "Concentration Curl", "Incline Curl"])
]
