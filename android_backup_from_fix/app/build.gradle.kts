plugins {
  id("com.android.application")
  id("org.jetbrains.kotlin.android")
  // Google services plugin will be applied below
}

android {
  namespace = "com.example.testapp"
  compileSdk = 33

  defaultConfig {
    applicationId = "com.example.testapp"
    minSdk = 21
    targetSdk = 33
    versionCode = 1
    versionName = "1.0.0"
    testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    vectorDrawables {
      useSupportLibrary = true
    }
  }

  buildTypes {
    getByName("release") {
      isMinifyEnabled = false
      proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    }
  }

  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
  }
  kotlinOptions {
    jvmTarget = "17"
  }
}

dependencies {
  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.8.10")
  implementation("androidx.core:core-ktx:1.10.1")
  implementation("androidx.appcompat:appcompat:1.6.1")

  // Firebase (BoM) and other Android deps used by your Dart packages
  implementation(platform("com.google.firebase:firebase-bom:34.5.0"))
  implementation("com.google.firebase:firebase-analytics")
}

// Apply Google services plugin after the android block
apply(plugin = "com.google.gms.google-services")