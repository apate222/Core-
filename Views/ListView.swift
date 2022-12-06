//
//  ListView.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI

//our listView controls the display of of our UserDefualt workout array
struct ListView: View {
    //we define our listViewModel to access our UserDefault workout array
    @EnvironmentObject var listViewModel: ListViewModel
    //we pass in a muscleGroup so that we can display only our saved leg workouts for our
    //leg workout list, same idea for all the other muscle groups
    let muscleGroup: MuscleGroup

    var body: some View {
        //our specificWorkoutList will filter the UserDefault workout array and only display
        //exercises of the same muscleGroup that we passed into the view from WorkoutPlanView
        //this line gives a warning, although I am not sure why, but it does not
        //cause any issues during execution in the iphone simulator
        var specificWorkoutList = listViewModel.workouts.filter{$0.muscle == muscleGroup.name}
        List {
            //We iterate through specificWorkoutList and use ListRowView to display
            //each exercise in our array
            ForEach(specificWorkoutList) { workout in
                ListRowView(workout: workout, muscleGroup3: muscleGroup)
                    
                //this onTapGesture controls our updating of the checkmark for each
                //workout we display
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(workout: workout)
                        }
                    }
            }
            //These lines control our ability to rearrange the position of workouts
            //in our array, as well as our ability to remove specific workouts
            .onDelete(perform: listViewModel.deleteWorkout)
            .onMove(perform: listViewModel.moveWorkout)
            }
        .listStyle(PlainListStyle())
        .navigationTitle("\(muscleGroup.name) Workout Plan")
        //.navigationBarItems creates the edit and add buttons on the top of our
        //ListView
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView(muscleGroup2: muscleGroup)))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView(muscleGroup: MuscleGroup.all[0])
        }
        .environmentObject(ListViewModel())
    }
}


