# Developer Info

All copyright reserved @Nimesh Vasani 

[GitHub Profile](https://github.com/NimeshVasani)

[Linked-In](https://www.linkedin.com/in/nimesh-vasani-99b642154/)

[Stack Overflow](https://stackoverflow.com/users/16579306/nimesh-vasani)

# About The App

This is New Kotlin Multiplatform Multiverse(KMM) Note App. Which work as a Native App on both platfrom(ios/Android).

In [KMM](https://kotlinlang.org/docs/multiplatform-mobile-getting-started.html), Project is Devided in 3 main Module.


1. Android App with [Jetpack Compose(Kotlin)](https://developer.android.com/jetpack/compose/tutorial?gclid=Cj0KCQjwxMmhBhDJARIsANFGOStPh7YOhBtFQyU3ILofDIjPxYDfbZmn59vEFwi9er06EG8tu9WryIwaAnDhEALw_wcB&gclsrc=aw.ds).

2. ios App with [SwiftUI](https://developer.apple.com/tutorials/swiftui)(Swift).

3. [Shared Module](https://kotlinlang.org/docs/multiplatform-mobile-understand-project-structure.html#shared-module), Common Shared logic in Kotlin Language. 


Built With : [Kotlin Multiplatform Multiverse- KMM](https://kotlinlang.org/docs/multiplatform-mobile-getting-started.html),
             [MVVM](https://developer.android.com/topic/libraries/architecture/viewmodel?gclid=CjwKCAjw5dqgBhBNEiwA7PryaEGGNXBuF_269i5vAml9SedixRgYXYfktdB8NOZm__qJWmdN6hpUahoC2IQQAvD_BwE&gclsrc=aw.ds#kotlin_1),
             [SqlDelight](https://kotlinlang.org/docs/multiplatform-mobile-ktor-sqldelight.html),[Dagger Hilt](https://developer.android.com/training/dependency-injection/hilt-android) with Proper [NavigationUI](https://developer.android.com/guide/navigation/navigation-getting-started).
                         
![alt text](https://github.com/NimeshVasani/KMM-NoteApp/blob/main/SnapShots/All_Screens.png)

# Set Up For KMM Projects

1. Goto `Android Studio` > `Setting` > `Plugins` > add `Kotlin Multiplatform Mobile` and `Restart the Android Studio`. 
2. `Download` and make `Xcode` ready for use. 
3. Set Up [`K-Doctor`](https://kotlinlang.org/docs/multiplatform-mobile-setup.html#check-your-environment)

   Using Comand `brew install kdoctor`
   
4. Create new Project `select Kotlin Multiplatform Mobile` from botton and name the app for both platform. 

# Set Up Shared Gradle file 

1. In Common Main Section 

 ```kotlin 

dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")

                implementation("com.squareup.sqldelight:runtime:1.5.5")
                implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.4.0")

            }
 ```
 
 2. In Android Main Section 
 
 ```kotlin
 
 dependencies {
                implementation("com.squareup.sqldelight:android-driver:1.5.5")
            }
            
```

3. In IOS Main Section

```kotlin
dependencies {
                implementation("com.squareup.sqldelight:native-driver:1.5.5")
            }
```

4. [Set Up Your Android Main App Gradle File.]((https://github.com/NimeshVasani/KMM-NoteApp/androidApp/build.gradle.kts) 

# Shared Module for ios/android in kotlin. 



             
