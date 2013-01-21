# AutomationExample

This is a demo app to showcase how to run UI Automation scripts from the
command line.

# Requirements

You need to have at least Xcode 4.5 along with the command line tools.

# Running The Demo

Just open a terminal window, change to the project directory and run this:

    ./run_automation.sh

It will build the application with `xcodebuild` in the `/tmp` directory and
then execute it with my `unix_instruments` wrapper that ensures that
Instruments returns a proper exist status code when a test fails. You can read
more about how that works in the copious comments.

# Running on iPad Simulator

For some reason, Instruments will always launch a universal app in the iPad simulator when launched from the command line. This happens even if you change the simulator device type explicitly in the menu. To get this to work, you need to rebuild the app and tell Xcode to explicitly choose one of the device family types like so:

    xcodebuild -sdk iphonesimulator clean build \
      CONFIGURATION_BUILD_DIR=$BUILD_DIR \
      TARGETED_DEVICE_FAMILY=1

Setting `TARGETED_DEVICE_FAMILY` to 1 changes the `Info.plist` file so that build is only for iPhone. Setting it to 2 makes it only for iPad.

