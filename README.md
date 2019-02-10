# ReverseCollectionView
By default UICollectionView has vertical layout where cells populate from Top-Left. How do we make it populate data from bottom-right instead.

## How to install?
1. Clone the Project using Commmad line or XCode or Anyother other tool.
2. You need to install Pod frameworks.
   - Open terminal and change directory to root folder of project. ``` $ cd <REPOSITORY-NAME> ```
   
   - Run ``` $ pod install ```
   - Once installing Pods successfully, Go to root folder and Open **ReverseCollectionView.xcworkspace** file insted of **ReverseCollectionView.xcodeproj**
   
## How to use App?
1. Need to have Authenticated To be able to access Realtime Database.
2. App lands on Login/Register page when App launched for first time.
3. If You are not already registered with App. Register with your email id and password.
4. If You are already registered with App. Login with your email id and password to Access Data.
5. CollectionView
   - Refresh data by clicking Refresh Button(Top right corner)
   - Delete user from Firebase Auth by clicking on Logout Button(Top left corner)
