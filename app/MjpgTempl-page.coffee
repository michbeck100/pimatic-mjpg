$(document).on 'templateinit', (event) ->

	jsmpeg = require 'jsmpeg'

	class MjpgDeviceItem extends pimatic.DeviceItem
		constructor: (templData, @device) ->
			super
			@id = @device.id
			@name = @device.name
			if @cameraUrl.startsWith("rtsp://")
				client = new Websocket("ws://localhost:#{device.port}");
				canvas = document.getElementById('videoCanvas');
				player = new jsmpeg(client, {
				    canvas: canvas // Canvas should be a canvas DOM element
				});

		afterRender : (elements) ->
			super

  # register the item-class
	pimatic.templateClasses['mjpg'] = MjpgDeviceItem
