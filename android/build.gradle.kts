// Root-level build.gradle.kts

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Google Services classpath
        classpath("com.google.gms:google-services:4.4.3")
        classpath("com.google.gms:google-services:4.3.15") 
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional: Custom build directory setup if needed
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
