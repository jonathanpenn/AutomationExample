var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();

var tableView = window.tableViews()[0];
var cells = tableView.cells();
var coffeeCell = cells["coffee"];

coffeeCell.tap();

target.delay(0.5);
var label = window.elements()[1];

if (label.name() != "coffee") {
  UIALogger.logError("Expected to see 'coffee'");
} else {
  var navBar = app.navigationBar();
  var backButton = navBar.leftButton();
  backButton.tap();
}

target.delay(0.5);
