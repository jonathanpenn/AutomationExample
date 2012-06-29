var Screen = function(properties) {

  for (key in properties) {
    if(properties.hasOwnProperty(key)) {
      this[key] = properties[key];
    }
  }

  return this;
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

ListScreen = new Screen({

  tapCellWithName: function(name) {
    return this.window().tableViews()[0].cells()[name].tap();
  }

});

DetailScreen = new Screen({

  displayedText: function() {
    return this.window().elements()[1].name();
  },

  tapBackButton: function() {
    this.navBar().leftButton().tap();
  }

});
