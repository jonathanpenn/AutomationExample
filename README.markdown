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

