pimatic-mjpg
=======================

This is a [Pimatic](http://pimatic.org) plugin to view [Motion JPEG](https://en.wikipedia.org/wiki/Motion_JPEG) streams.

Installation
-------------

Add the plugin to the plugin section:
```json
{
  "plugin": "mjpg"
}
```
Configuration
-------------

You have to add the mjpg stream URL to your mjpg device into your config.json.

```json
{
  "id" : "webcam",
  "class": "MjpgDevice",
  "name": "Webcam",
  "cameraUrl": "[URL from your mjpg stream]"
}
```

Changelog
---------------
0.0.1
* initial release

Notes:
-------------
This plugin is based on [pimatic-ipcamera](https://github.com/funky81/pimatic-ipcamera). So Credits go to funky81, for the initial idea.
