# Android dev on Mac

Install IntelliJ Android Studio

## Accept Android SDK license agreements

```
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
yes | ~/Library/Android/sdk/tools/bin/sdkmanager --licenses
```

## Install Screencopy

Site: <https://github.com/Genymobile/scrcpy>

or just:
```
brew install scrcpy
```

## Install `adb` and all that

```
brew install --cask android-platform-tools
```

## Enable debugging on Android device

Instructions here: <https://developer.android.com/studio/command-line/adb#Enabling>

or, TL;DR:

- Settings / About Phone

- Tap `Build Number` 7 times

- Settings / Developer Options / enable USB debugging

- Make sure adb is running on your machine (just type `adb devices` and it will start the daemon if it needs to)

- Plug in your phone to computer via cable, a dialog should pop up on phone asking for permission to connect to USB.

- `adb devices` should now list your phone, 
and in `Android Studio` your phone should show under the `running devices` menu (next to green run arrow at top rught of screen).
