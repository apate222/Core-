//
//  ListViewModel.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import Foundation
//This file defines our ListViewModel class which will be used
//making the class conform to ObservableObject allows us to reference this class in other views
//also observableObject allows us to update the values of the class which will be reflected in all views referencing this class
class ListViewModel: ObservableObject {
    
    //This is our array we use to store user saved workouts using UserDefault data.
    @Published var workouts: [WorkoutModel] = [] {
        didSet {
            saveWorkouts()
        }
    }
    //this is the key we use for JSONEncoding and JSONDecoding
    let workoutsKey: String = "workouts_list"
    
    init() {
        getWorkouts()
    }
    
    //this function populates the workouts array when referenced in other views
    func getWorkouts() {
        //We use a guard statement with let and try? statements to attempt to decode data from our UserDefault data base
        //if we fail to decode data we will return nothing, this will only happen when there is no data stored in the UserDefault array
        guard
            let data = UserDefaults.standard.data(forKey: workoutsKey),
            let savedWorkouts = try? JSONDecoder().decode([WorkoutModel].self, from: data)
        else {return}
        
        self.workouts = savedWorkouts
    }
    //This will remove a selected workout
    func deleteWorkout(indexSet: IndexSet) {
        workouts.remove(atOffsets: indexSet)
    }
    //this function describes our functionality to reorder items in our listview
    func moveWorkout(from: IndexSet, to: Int) {
        workouts.move(fromOffsets: from, toOffset: to)
    }
    //this function describes the functionality to append a selected workout through our addview
    func addWorkout(title: String) {
        let newWorkout = WorkoutModel(name: title, isCompleted: false, description: "Test", muscle: "Test", weightType: "Test", image: "Test")
        workouts.append(newWorkout)
    }
    
    //this function allows us to save data that is added to our workouts array to our UserDefault data
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encodedData, forKey: workoutsKey)
        }
    }
    //This function will updates the isCompleted field allowing us to keep track of which workouts have been completed in our listView with the
    //checkmark
    func updateItem(workout: WorkoutModel)
    {
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts[index] = workout.updateCompletion()
        }
    }
    
}
