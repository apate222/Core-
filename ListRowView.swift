//
//  ListRowView.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI

//ListRoWView is used to display our specific workouts in ListView
struct ListRowView: View {
    //we pass in the workout of type WorkoutModel we want to display
    let workout: WorkoutModel
    //we pass in the corresponding muscleGroup for a check later
    let muscleGroup3: MuscleGroup
    
    var body: some View {
        HStack{
            //We display checkmark.circle if workout.isCompleted is true
            //if it is not true we will display the circle.
            Image(systemName: workout.isCompleted ? "checkmark.circle" : "circle")
            //here we checkmark.circle to be green, and circle to be red
                .foregroundColor(workout.isCompleted ? .green : .red)
            if workout.muscle == muscleGroup3.name {
                //this check shouldn't ever fail, so it is a bit redundant,
                //but it makes sure we don't display a workout that does not correspond
                //to the correct muscleGroup of our ListView
                Text(workout.name)
            } else {
                
            }
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = WorkoutModel(name: "Test", isCompleted: true, description: "Test", muscle: "Test", weightType: "Test", image: "Test")
    static var item2 = MuscleGroup(name: "test", workouts: [item1], image: "test")
    
    static var previews: some View {
        ListRowView(workout: item1, muscleGroup3: item2)
    }
}
