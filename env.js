// This is the Screen object "superclass" that has methods that other screen
// objects can share.
var Screen = function(properties) {

  for (key in properties) {
    if(properties.hasOwnProperty(key)) {
      this[key] = properties[key];
    }
  }

};

Screen.prototype = {
  target: function() {
    return UIATarget.localTarget();
  },

  app: function() {
    return this.target().frontMostApp();
  },

  navBar: function() {
    return this.app().navigationBar();
  },

  window: function() {
    return this.app().mainWindow();
  }
};

// The specific screen objects that encapsulate the behavior that the user
// does.
ListScreen = new Screen({
  tapCellWithName: function(name) {
    return this.window().tableViews()[0].cells()[name].tap();
  }
});

DetailScreen = new Screen({
  displayedText: function() {
    return this.window().staticTexts()[0].name();
  },

  tapBackButton: function() {
    this.navBar().leftButton().tap();
  }
});
