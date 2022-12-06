//
//  WorkoutModel.swift
//  Core+ Final
//
//  Created by Avi Patel, Casey Williams, Ethan Kraznai, and Ayush Patel on 12/5/22.
//

import Foundation
//In this file we define the structs we use for our given workouts list in WorkoutView and descriptionView

//This struct is used for our list that is displayed in WorkoutView, each MuscleGroup has an array of WorkoutModels
//made up of the exercises in defaultWorkoutList that correspond to the correct muscleGroup
struct MuscleGroup: Identifiable, Hashable {
    var id: String {
        name
    }
    var name: String
    var workouts: [WorkoutModel]
    var image: String
    
    static var all: [MuscleGroup] {
        [
            MuscleGroup(name: "Legs", workouts: WorkoutModel.defaultWorkoutList.filter{$0.muscle == "Legs"}, image: "leg"),
            MuscleGroup(name: "Chest", workouts: WorkoutModel.defaultWorkoutList.filter{$0.muscle == "Chest"}, image: "chest"),
            MuscleGroup(name: "Back", workouts: WorkoutModel.defaultWorkoutList.filter{$0.muscle == "Back"}, image: "back"),
            MuscleGroup(name: "Shoulders", workouts: WorkoutModel.defaultWorkoutList.filter{$0.muscle == "Shoulders"}, image: "shoulder"),
            MuscleGroup(name: "Arms", workouts: WorkoutModel.defaultWorkoutList.filter{$0.muscle == "Arms"}, image: "bicep_curls")
        ]
    }
}

//The workoutModel struct defines our exercises, the struct contains our defaultWorkoutList which contains all of our workouts to
//build workout plans with.
struct WorkoutModel: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let isCompleted: Bool
    let muscle: String
    let weightType: String
    let image: String
    let description: String
    
    init(id: String = UUID().uuidString, name: String, isCompleted: Bool, description: String, muscle: String, weightType: String, image: String) {
        self.id = id
        self.name = name
        self.description = description
        self.muscle = muscle
        self.weightType = weightType
        self.image = image
        self.isCompleted = isCompleted
    }
    
    //this function works in tandem with our updateCompletion function to update the designated workouts isCompleted
    //to update the checkmarks in the listView, this function works by replacing our selected WorkoutModel with a new one that has the
    //exact same values expect the isCompleted field is toggled
    func updateCompletion() -> WorkoutModel {
        return WorkoutModel(name: name, isCompleted: !isCompleted, description: description, muscle: muscle, weightType: weightType, image: image)
    }
    
    //This is our default list of workouts that are displayed in the workoutView
    static var defaultWorkoutList: [WorkoutModel] =
        [
            WorkoutModel(name: "Bodyweight Squat", isCompleted: false, description: "Stand with your hands on the back of your head and your feet shoulder-width apart with your feet turned out slightly to open the hip joint. Lower your body until your thighs are parallel to the floor. Pause, then return to the starting position.", muscle: "Legs", weightType: "Home", image: "Bodyweight Squat"),
            WorkoutModel(name: "Walking Lunge", isCompleted: false, description: "Walking lunges are a variation on the static lunge exercise. Instead of standing back upright after performing a lunge on one leg, as you would in a static bodyweight lunge, you “walk” forward by lunging out with the other leg. The movement continues for a set number of reps.", muscle: "Legs", weightType: "Home", image: "Walking Lunge"),
            WorkoutModel(name: "Wall Sit", isCompleted: false, description: "The person wall sitting places their back against a wall with their feet shoulder-width apart and a little ways out from the wall. Then, keeping their back against the wall, they lower their hips until their knees form right angles.", muscle: "Legs", weightType: "Home", image: "Wall Sit"),
            WorkoutModel(name: "Leg Press", isCompleted: false, description: "Leg presses are done in a seated position. Your legs repeatedly press against weights, which can be adjusted according to your fitness level. This targets your quads, glutes, hamstrings, hips, and calves. The seated position of leg presses helps keep your upper body and torso still.", muscle: "Legs", weightType: "Machine", image: "Leg Press"),
            WorkoutModel(name: "Leg Extension", isCompleted: false, description: "Leg extensions are done on a leg extension machine. You sit on the machine with a weighted pad on top of your lower legs. Then you use your quads to repeatedly extend your knees and lift your lower legs.", muscle: "Legs", weightType: "Machine", image: "Leg Extension"),
            WorkoutModel(name: "Leg Curl", isCompleted: false, description: "A leg curl is an exercise that strengthens the hamstrings. It involves bending your knees and moving your heels toward your butt while the rest of your body stays still.", muscle: "Legs", weightType: "Machine", image: "Leg Curl"),
            WorkoutModel(name: "Bulgarian Squat", isCompleted: false, description: "The Bulgarian Split Squat is a squat variation where one leg is elevated on a surface and the other performs a squat, receiving most of the load. Because of this split position, this single-leg unilateral exercise targets the quadricep muscles, glutes, and hamstrings like no other leg exercise.", muscle: "Legs", weightType: "Free", image: "Bulgarian Squat"),
            WorkoutModel(name: "Hip Raise", isCompleted: false, description: "Lie face up on the floor with your knees bent and feet flat on the floor. Squeeze your glutes and press into your heels to raise your hips until your body forms a straight line from your shoulders to your knees. Pause, then slowly lower your back to a starting position. ", muscle: "Legs", weightType: "Free", image: "Hip Raise"),
            WorkoutModel(name: "Romanian Deadlift", isCompleted: false, description: "A movement in which your hips hinge backward to lower down and pick up a weighted barbell or kettlebell from the floor. Your back is flat throughout the movement. Some benefits of performing deadlifts include strengthening and gaining more definition in your upper and lower back, glutes, and hamstrings.", muscle: "Legs", weightType: "Free", image: "Romanian Deadlift"),
            WorkoutModel(name: "Pushup", isCompleted: false, description: "An exercise in which a person, keeping a prone position, with the hands palms down under the shoulders, the balls of the feet on the ground, and the back straight, pushes the body up and lets it down by an alternate straightening and bending of the arms.", muscle: "Chest", weightType: "Home", image: "Pushup"),
            WorkoutModel(name: "Incline Pushup", isCompleted: false, description: "An elevated form of a traditional pushup. Your upper body is elevated with an exercise box or other piece of equipment. You may find incline pushups to be a step up from your normal routine.", muscle: "Chest", weightType: "Home", image: "Incline Pushup"),
            WorkoutModel(name: "Diamond Pushup", isCompleted: false, description: "A more advanced variation of the classic push-up. Practice diamond push-ups by bringing your hands close together to form a diamond or triangle shape below your chest. Keep your back and legs in a straight line and push yourself off the ground.", muscle: "Chest", weightType: "Home", image: "Diamond Pushup"),
            WorkoutModel(name: "Chest Press", isCompleted: false, description: "Bend your arms at a 90° angle and keep your elbows at chest level. Gripping the pec deck handles, pull your arms toward your body while contracting your pectoral muscles. Bring the handles or arm pads in front of your chest, hold the position for a couple of seconds, and then slowly release back to starting position.", muscle: "Chest", weightType: "Machine", image: "Chest Press"),
            WorkoutModel(name: "Chest Cable Flies", isCompleted: false, description: "Set the pulleys on a dual-cable machine to chest height, and stand between the two stacks. Grab the handles. Keeping your back straight and core engaged, raise your arms out to your sides, palms facing forward, and walk a step or two forward in order to create tension on the cables. Stand with one foot in front of the other. Bend your elbows slightly, making sure not to let them travel behind your shoulders. This is your starting position. Pull your hands toward each other in wide arcs in front of you, pausing when your hands touch before slowly returning to the starting position. Alternate your forward foot with each set.", muscle: "Chest", weightType: "Machine", image: "Chest Cable Flies"),
            WorkoutModel(name: "Seated Cable Press", isCompleted: false, description: "The seated cable shoulder press is a multijoint machine-based exercise that focuses on the deltoid or shoulder muscles, as well as the triceps. It's most common in muscle-building workouts and rep ranges, usually 8-12 reps or more.", muscle: "Chest", weightType: "Machine", image: "Seated Cable Press"),
            WorkoutModel(name: "Bench Press", isCompleted: false, description: "The bench press is a compound exercise that targets the muscles of the upper body. It involves lying on a bench and pressing weight upward using either a barbell or a pair of dumbbells. During a bench press, you lower the weight down to chest level and then press upwards while extending your arms.", muscle: "Chest", weightType: "Free", image: "Bench Press"),
            WorkoutModel(name: "Incline Bench Press", isCompleted: false, description: "The incline press is to focus more of the work on the upper pecs. The main benefit in performing incline presses is to develop the upper portion of the pectoral muscles. When the bench is set at an incline (15 to 30 degrees), you activate your shoulders more since it's comparable to a shoulder press.", muscle: "Chest", weightType: "Free", image: "Incline Bench Press"),
            WorkoutModel(name: "Dumbbell Flies", isCompleted: false, description: "The exercise is performed on a bench with feet flat on the ground and knees bent at a 90-degree angle. People who are just starting their fitness journey can use a lighter weight or perform the exercise with just their body weight.", muscle: "Chest", weightType: "Free", image: "Dumbbell Flyes"),
            WorkoutModel(name: "Pullup", isCompleted: false, description: "A pull-up is an upper-body exercise that involves hanging from a pull-up bar by your hands with your palms facing away from you, and lifting your entire body up with your arm and back muscles until your chest touches the bar. The pull-up movement uses multiple muscles at once, making it a compound exercise.", muscle: "Back", weightType: "Home", image: "Pullup"),
            WorkoutModel(name: "Chin Ups", isCompleted: false, description: "Chin Ups are similar to pullups in that you grip and hang from a straight, horizontal bar and pull your body up toward the bar, ideally to chest level. The main difference is the grip variation. Chinups use a supinated grip, meaning your palms face you.", muscle: "Back", weightType: "Home", image: "Chin Ups"),
            WorkoutModel(name: "Back Extension", isCompleted: false, description: "Back extension is a type of stabilization exercise used in back rehabilitation programs that involves bending the spine backwards.", muscle: "Back", weightType: "Home", image: "Back Extension"),
            WorkoutModel(name: "Lat Pulldown", isCompleted: false, description: "The pulldown exercise works the back muscles and is performed at a workstation with adjustable resistance, usually plates. While seated, you pull a hanging bar toward you to reach chin level, then release it back up with control for one repetition.", muscle: "Back", weightType: "Machine", image: "Lat Pulldown"),
            WorkoutModel(name: "Seated Row", isCompleted: false, description: "The seated row is an exercise you can do with a weight machine to work the muscles in your upper back. Specifically, the seated row targets the muscles in your upper back and also the latissimus dorsi — a muscle on the outer side of the chest wall.", muscle: "Back", weightType: "Machine", image: "Seated Row"),
            WorkoutModel(name: "Rear Delt Flies", isCompleted: false, description: "A weight training exercise that targets your upper back muscles and shoulder muscles, particularly the posterior deltoids, or rear deltoids, on the backside of your shoulders.", muscle: "Back", weightType: "Machine", image: "Rear Delt Flies"),
            WorkoutModel(name: "Bent Over Row", isCompleted: false, description: "Lift the bar from the rack, bend forward at the hips, and keep the back straight with a slight bend in the knees. Lower the bar towards the floor until the elbows are completely straight, and keep the back flat as the bar is pulled towards the belly button. Then slowly lower the bar to the starting position and repeat.", muscle: "Back", weightType: "Free", image: "Bent Over Row"),
            WorkoutModel(name: "Incline Row", isCompleted: false, description: "Take a dumbbell in each hand with a neutral grip, beginning with the arms straight. This will be your starting position. Retract the shoulder blades and flex the elbows to row the dumbbells to your side. Pause at the top of the motion, and then return to the starting position.", muscle: "Back", weightType: "Free", image: "Incline Row"),
            WorkoutModel(name: "Rack Pull", isCompleted: false, description: "A deadlift variation in which a loaded barbell is set up on the supports of a power rack, usually just above or below the knees, and lifted by gripping the bar and extending the hips to full lockout.", muscle: "Back", weightType: "Free", image: "Rack Pull"),
            WorkoutModel(name: "Pike Pushups", isCompleted: false, description: "Lift hips up and back until your body forms an inverted V shape. Keep arms and legs as straight as possible. Start to bend elbows, and then lower your entire upper body toward the floor. Stay there for a moment, then slowly push back up until your arms are straight and you're in the inverted V position.", muscle: "Shoulders", weightType: "Home", image: "Pike Pushups"),
            WorkoutModel(name: "Shoulder Taps", isCompleted: false, description: "Unlike a traditional plank, which is an isometric exercise, shoulder taps are an active move that require you to use your palms to alternately touch the top of your opposite arm while holding your body still.", muscle: "Shoulders", weightType: "Home", image: "Shoulder Taps"),
            WorkoutModel(name: "Arm Circles", isCompleted: false, description: "The arm circle is a non-weighted exercise targeting the shoulders. It involves extending your arms to the sides and drawing small circles in the air with your hands.", muscle: "Shoulders", weightType: "Home", image: "Arm Circles"),
            WorkoutModel(name: "Face Pull", isCompleted: false, description: "Face pulls target the posterior deltoids of the shoulder, which are often neglected by other shoulder exercises. You use a cable pulley machine to pull the weight straight toward your forehead. Exercising the rear delts will prevent muscular imbalance and build overall shoulder strength.", muscle: "Shoulders", weightType: "Machine", image: "Face Pull"),
            WorkoutModel(name: "Reverse Fly", isCompleted: false, description: "Lean forward, letting your arms hang down next to your calves with your elbows slightly bent. Slowly raise the weights until your elbows are level with your shoulders. Then slowly lower the weights to the starting position. You'll feel the tension in your shoulders and the muscles across your upper back.", muscle: "Shoulders", weightType: "Machine", image: "Reverse Fly"),
            WorkoutModel(name: "Machine Shoulder Press", isCompleted: false, description: "The shoulder press machine is a fixed resistance bit of kit that sees you press overhead from a seated position.", muscle: "Shoulders", weightType: "Machine", image: "Machine Shoulder Press"),
            WorkoutModel(name: "Arnold Press", isCompleted: false, description: "In the Arnold press, the dumbbells not only are lowered to the shoulders, or even slightly lower but your hands are also rotated so that your palms face your face at the bottom. This increases the range of motion of the movement.", muscle: "Shoulders", weightType: "Free", image: "Arnold Press"),
            WorkoutModel(name: "Front Raise", isCompleted: false, description: "The front raise, also known as the dumbbell front raise, is a weight training exercise that targets your shoulder muscles. Perform front raises by standing and using an overhand grip to lift a pair of dumbbells from the front of your thighs to shoulder level in front of your body.", muscle: "Shoulders", weightType: "Free", image: "Front Raise"),
            WorkoutModel(name: "Lateral Raise", isCompleted: false, description: "A strength training shoulder exercise characterized by lifting a pair of dumbbells away from your body in an external rotation. Lateral raises work the trapezius muscle in your upper back as well as the deltoid muscle group in your shoulders—particularly the anterior and lateral deltoids.", muscle: "Shoulders", weightType: "Free", image: "Lateral Raise"),
            WorkoutModel(name: "Tricep Dip", isCompleted: false, description: "Tricep dips can be performed on parallel bars at your gym or even on a playground. You hold your entire body weight up with your arms extended and feet hovering over the floor, ankles crossed. Lower your body until your elbows reach a 90-degree angle before returning to your starting position.", muscle: "Arms", weightType: "Home", image: "Tricep Dip"),
            WorkoutModel(name: "Tricep Pushup", isCompleted: false, description: "Get into a plank position with your hands directly below syour houlders, your neck and spine neutral, and your feet together. On the descent, keep your elbows pinned to your sides and your upper arms straight back. Lower down until your chest reaches the floor and return to start.", muscle: "Arms", weightType: "Home", image: "Tricep Pushup"),
            WorkoutModel(name: "Preacher Curl", isCompleted: false, description: "Set up on the preacher bench, holding a dumbbell in each hand by your shoulders with your palms facing away from you. Lower the weights slowly until your arms are fully extended, then rotate your hands so your palms face towards you and curl the dumbbells back up to your shoulders.", muscle: "Arms", weightType: "Machine", image: "Preacher Curl"),
            WorkoutModel(name: "Tricep Extension", isCompleted: false, description: "Stand with feet hip width apart with a slight bend in the knees. Grip the bar with palms facing downwards, about shoulder width apart. Keeping your elbows close to your body, take a slight forward lean, and exhale as you push the bar down till your arms full extended.", muscle: "Arms", weightType: "Machine", image: "Tricep Extension"),
            WorkoutModel(name: "Cable Tricep Kickback", isCompleted: false, description: " Stand with feet hip width apart with a slight bend in the knees. Grip the bar with palms facing downwards, about shoulder width apart. Keeping your elbows close to your body, take a slight forward lean, and exhale as you push the bar down till your arms full extended.", muscle: "Arms", weightType: "Machine", image: "Cable Tricep Kickback"),
            WorkoutModel(name: "Bicep Curl", isCompleted: false, description: "An exercise in which you bend your arm towards your body at the elbow in order to make your biceps stronger.", muscle: "Arms", weightType: "Free", image: "Bicep Curl"),
            WorkoutModel(name: "Hammer Curl", isCompleted: false, description: "Hammer curls are biceps curls performed with your hands facing each other.", muscle: "Arms", weightType: "Free", image: "Hammer Curl"),
            WorkoutModel(name: "Skullcrusher", isCompleted: false, description: "An isolation exercise focused on your triceps muscles. Skull crushers are performed by lying on your back on a flat bench and lifting dumbbells from behind your head to full extension above you.", muscle: "Arms", weightType: "Free", image: "Skullcrusher"),
        ]
    
}
