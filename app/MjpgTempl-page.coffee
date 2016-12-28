$(document).on 'templateinit', (event) ->

	class MjpgDeviceItem extends pimatic.DeviceItem
		constructor: (templData, @device) ->
			super
			@id = @device.id
			@name = @device.name
			@cameraUrl = @device.config.cameraUrl

		afterRender : (elements) ->
			super

  # register the item-class
	pimatic.templateClasses['mjpg'] = MjpgDeviceItem
