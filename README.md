# ocaml-cordova-plugin-firebase

Binding to [cordova-plugin-firebase](https://github.com/arnesson/cordova-plugin-firebase)

## What does ocaml-cordova-plugin-firbase do ?

This plugin provides functions that give the opportunity to use the
"firebase" cordova plugin in your ocaml projects.

> This plugin brings push notifications, analytics, event tracking,
  crash reporting and more from Google Firebase to your Cordova project!
  Android and iOS supported.

Source: [cordova-plugin-firebase](https://github.com/arnesson/cordova-plugin-firebase)

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add cordova-plugin-firebase https://github.com/Thibaut-Gudin/ocaml-cordova-plugin-firebase
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the cordova plugin "mixpanel" with:
```Shell
cordova plugin add cordova-plugin-firebase
```


## How to use it?

### Cordova_firebase.available
You can use this function to know if the object "Cordova_firebase" is
available in your project, it is recommended to use it before to call
other functions from this plugin.

### Cordova_firebase.acess_analytics
You can use this function to know if the "Analytics" of firebug is
available, it is recommended to use it before to call functions of this
plugin that depends on "cordova-plugin-firebase.analytics".

### What is the type Properties.t?
The type "Properties.t" is an associative array of properties to store about the user (for
example "{'Gender': 'Male', 'Age': 21}"), this type is used for
function arguments.
You can create a "Properties.t" object with the function
"Properties.create" that can convert a list of (string * string) into a "Properties.t" object:
```Shell
let props = [("Gender", "Male");("Age", "21")] in
let properties = Cordova_firebase.Properties.create props
```

### Cordova_firebase.logEvent

> Log an event using Analytics

Source : [cordova-plugin-firebase API](https://github.com/arnesson/cordova-plugin-firebase/blob/master/docs/API.md)

This function can take an optional argument "params" of type "Properties.t"

See :[firebase analytics functions API](https://rnfirebase.io/reference/analytics#logEvent) for more details

### Cordova_firebase.setAnalyticsCollectionEnabled

> Enable/disable analytics collection

Source : [cordova-plugin-firebase API](https://github.com/arnesson/cordova-plugin-firebase/blob/master/docs/API.md)
