#import "env.js"

var target = UIATarget.localTarget();

ListScreen.tapCellWithName("coffee")

target.delay(0.5);

var text = DetailScreen.displayedText();
if (text != "coffee") {
  UIALogger.logError("Expected to see 'coffee'");
} else {
  UIALogger.logMessage("Saw 'coffee'!");
  DetailScreen.tapBackButton();
}

target.delay(0.5);
