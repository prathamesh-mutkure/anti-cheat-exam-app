



# Anti-Cheat Exam App  🌟


An App that aims to stop cheating in online exams with the power of AI and ML, co-created with [Samyak Sukhdeve](https://github.com/SamyakSukhdeve)

<p align="center">  
<img src="https://user-images.githubusercontent.com/28570857/178106216-25d91b1c-06cf-42fa-85fc-cf3540868b1f.png"/>  
</p>



## Features and Interfaces

1. Login Page
   - Login with the provided user id and password

2. Home page
   - Shows all the exams assigned to the user
   - The user can start an exam only on the correct timeslot
   - Logout through button in the app bar

3. Exam Page
   - The user can answer MCQ-based questions
   - The user can also view their progress

   - ![image](https://user-images.githubusercontent.com/28570857/179022654-f59b6b0c-77d7-48f4-9a55-32813378a696.png)


7. AI-powered face motion detector
   - We've used Google's on-device `ml-kit` to track the motion of the user's face.
   - We can check if a user is trying to cheat by monitoring the position of their face

   - ![image](https://user-images.githubusercontent.com/28570857/179022316-45cf8a11-9d5a-411f-b4ce-89d1ea02e478.png)



## Tech stack

#### Frontend
- Flutter


#### Backend
- Nodejs
- Express
- MongoDB

#### Other Tools
- Google's on-device ML Kit

## Points to remember while testing the app

1. First setup the backend by following instructions in this [repository](https://github.com/prathamesh-mutkure/anti-cheat-app-backend)
2. When testing on android emulator, if you get a connection error use `http://10.0.2.2/` instead of `localhost`
3. iOS emulator doesn't support camera, this will give an error, use a real device to test AI features.
4. On real devices, make sure your PC and mobile are connected to same network, use network IP address instead of `localhost`
5. Don't forgot the `PORT` number
6. Allow **permissions** for camera and mic when asked
7. Make sure the `BACKEND_URL` is appended with `/api`

## Instructions


1. Import the project through Android Studio or clone it
   - `https://github.com/prathamesh-mutkure/anti-cheat-exam-app.git`
3. Install flutter packages
   - `flutter pub get`
4. Generate store classes
   - `flutter packages pub run build_runner build`
5. Create a `.env` file and set the following variables
   -  `BACKEND_URL`
6. Connect your device or emulator and run the app
   - `flutter run`
7. The app is now running


## Useful Links

- [Backend Repository](https://github.com/prathamesh-mutkure/anti-cheat-app-backend)
- [Project Thesis](https://drive.google.com/file/d/1fXXXjcE74pIOEwavstTmporuOECc7cUu/view)  (Submited in diploma)


## Need help?

Feel free to contact me on [Twitter](https://twitter.com/Prathamesh_M009/)  or [LinkedIn](https://www.linkedin.com/in/prathamesh-mutkure/), know more about me at [prathamesh.co](https://prathamesh.co)

[![Twitter](https://img.shields.io/badge/Twitter-follow-blue.svg?logo=twitter&logoColor=white)](https://twitter.com/Prathamesh_M009/) [![Instagram](https://img.shields.io/badge/Instagram-follow-purple.svg?logo=instagram&logoColor=white)](https://www.instagram.com/prathamesh_mutkure/) 