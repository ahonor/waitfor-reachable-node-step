A very trivial example showing how to use a Node Step plugin
to execute commands to test if a Node is reachable.
This might be useful after a node is rebooted and you want
to wait for it to be reachable before proceeding to other steps.

This is a script-based plugin that demonstrates a few features:

* User chooses a command to execute a test to see if a host is reachable.
* Use a "Select" configuration property to give a user a menu of command choices.
* Use "Integer" configuration property to ensure a valid whole number is given for interval and maxtry parameters.
* Use a STATIC_TEXT rendering option to provide some markdown text for help in the job editor.


See [Script Plugin Development](http://rundeck.org/docs/developer/plugin-development.html#script-plugin-development)