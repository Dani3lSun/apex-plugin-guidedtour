#Oracle Apex DynamicAction Plugin - GuidedTour
Dynamic Action Plugin using OpenSource JS framework "Stepherd".
It´s useful to guide your users through the application, or give your users a first run wizard to explain parts of your app.
(https://github.com/HubSpot/shepherd)

This is not an single plugin, instead it contains 3 DA plugins.
The Framework shepherd.js is splitted in 3 sections:
- Initialize the guided tour
- Add several tour steps
- Start the guided tour

So the plugins are exactly for this events:
- GuidedTour (New Instance)
- GuidedTour (Add Step)
- GuidedTour (Start Tour)


##Changelog
####1.0 - Initial Release

##Install
- Import plugin files "dynamic_action_plugin_de_danielh_gt_newinstance.sql / dynamic_action_plugin_de_danielh_gt_addstep.sql / dynamic_action_plugin_de_danielh_gt_starttour.sql" from source directory into your application
- (Optional) Deploy the CSS/JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

##Plugin Settings / How to use
On target page create a single Dynamic Action, say "GuidedTour".
Event should be set to "Page Load"!
This DA has multiple true actions.

####GuidedTour (New Instance):
Here you can choose 4 shepherd themes / templates for the look&feel.
Use this true action, only once. Should have the smallest sequence of all true actions, so it is called first. 

####GuidedTour (Add Step):
This true action adds a step "popup". You can customize it with this values:
- Step title
- Step text
- Button close text
- Button next text
- Position (botton/top/left/right)
- Attach to CCS class: (shepherd is designed to attach the popup to a css class, for example ".t-Body-nav" for navigation menu or ".t-Body-actions" for the action menu on right side. for items use "#P1_ITEM_NAME". Without quotes!)

This true action can be used multiple times. The order/sequences of the true actions are the order in which they are executed.

####GuidedTour (Start Tour):
This true action starts the tour with all steps from before. Put it at the end of all true actions.

##Demo Application
https://apex.oracle.com/pls/apex/f?p=57743:1

---
