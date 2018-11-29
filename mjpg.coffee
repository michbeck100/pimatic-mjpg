module.exports = (env) ->
	Promise = env.require 'bluebird'
	assert = env.require 'cassert'

	class MjpgPlugin extends env.plugins.Plugin
		init: (app, @framework, @config) =>
			port = 9999
			deviceConfigDef = require("./device-config-schema.coffee")
			@framework.deviceManager.registerDeviceClass("MjpgDevice",{
				configDef : deviceConfigDef.MjpgDevice,
				createCallback : (config) =>
					port = port + 1
					return new MjpgDevice(config, port, @framework)
			})
			@framework.on "after init", =>
				mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
				if mobileFrontend?
					mobileFrontend.registerAssetFile 'js', "pimatic-mjpg/app/MjpgTempl-page.coffee"
					mobileFrontend.registerAssetFile 'html', "pimatic-mjpg/app/MjpgTempl-template.html"

	class MjpgDevice extends env.devices.Device

		template: 'mjpg'

		constructor: (@config, @port, @framework) ->
			@id = @config.id
			@name = @config.name
			super()

			@framework.once "after init", =>
				if @config.cameraUrl.startsWith("rtsp://")
					Stream = require 'node-rtsp-stream'
					options = {
						name: @config.name
	    			streamUrl: @config.cameraUrl
	    			wsPort: @port
					}
					stream = new Stream(options)

		destroy: ->
			super

	return new MjpgPlugin()
