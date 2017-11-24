# DefWindow
Extra functionality for Defold's Window API

## Installation
You can use DefWindow in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

https://github.com/subsoap/defwindow/archive/master.zip
  
Once added, you must require the main Lua module in scripts via

```
local defwindow = require("defwindow.defwindow")
```

Make sure you have Shared State enabled for scripts in your game.project file

## Usage
If you're using a module which needs to have a Window callback function while you also want to have a callback function elsewhere then use DefWindow.

DefWindow is simple and easy to use. First initialize DefWindow

```
defwindow.init()
```

Then you can add as many listener callback functions as you wish in any number of scripts

```
defwindow.add_listener(my_listener_function_1)
```
```
defwindow.add_listener(my_listener_function_2)
```

Keep your callback functions in your main script which is never unloaded.

You can clear all callback functions at once if you need to, but you probably shouldn't do this.

```
defwindow.clear_listeners()
```

DefWindow also provides the current window size which is updated as the window is resized.

If the initial window size is not accurate then use DefOS. Attempting to use DefWindow with your render script will not work as "window" is not available there and so breaks.
