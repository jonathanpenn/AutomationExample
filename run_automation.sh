echo "Make sure you are using Xcode 4.3.3"

BUILD_DIR=/tmp/AutomationExample

mkdir -p $BUILD_DIR

xcodebuild -sdk iphonesimulator build CONFIGURATION_BUILD_DIR=$BUILD_DIR

rm -rf automation_results
mkdir -p automation_results

./unix_instruments \
  -D automation_results/trace \
  -t UIAutomationTemplate.tracetemplate \
  $BUILD_DIR/AutomationExample.app \
  -e UIARESULTSPATH automation_results \
  -e UIASCRIPT automation_script.js

if [[ $? == 0 ]]; then
  echo "Tests passed!"
else
  echo "Tests failed!"
fi
