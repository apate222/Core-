//
//  AddView.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import SwiftUI
//AddVie
struct AddView: View {
    //again we pass in a muscleGroup, that should correspond to the muscleGroup of
    //of our WorkoutPlan
    let muscleGroup2: MuscleGroup
    //this variable will be used to automatically navigate back to ListView when we add
    //a workout to our UserDefualt array
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                //here we display all workouts of the correct muscleGroup
                List(muscleGroup2.workouts) { iter in
                        Text(iter.name)
                    //this controls when we tap on one of the workouts it will
                    //append our selected workout to our UserDefault array of workouts
                        .onTapGesture {
                            listViewModel.workouts.append(iter)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add a workout")
    }
}

struct AddView_Previews: PreviewProvider  {
    static var previews: some View {
        NavigationStack {
            AddView(muscleGroup2: MuscleGroup.all[0])
        }
        .environmentObject(ListViewModel())
    }
}
