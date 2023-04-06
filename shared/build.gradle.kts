plugins {
    kotlin("multiplatform")
    id("com.android.library")
    kotlin("plugin.serialization") version "1.8.10"
    id("com.squareup.sqldelight")
}

kotlin {
    android()

    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
        }
    }


    sourceSets {
        val commonMain by getting{
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")

                implementation("com.squareup.sqldelight:runtime:1.5.5")
                implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.4.0")

            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting{
            dependencies {
                implementation("com.squareup.sqldelight:android-driver:1.5.5")
            }
        }
        val androidTest by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
            dependencies {
                implementation("com.squareup.sqldelight:native-driver:1.5.5")
            }
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }
}
sqldelight{
    database("NoteDatabase"){
        packageName = "diamondcraft.devs.mynoteapp.database"
    }
}
android {
    namespace = "diamondcraft.devs.mynoteapp"
    compileSdk = 33
    defaultConfig {
        minSdk = 23
        targetSdk = 33
    }
}