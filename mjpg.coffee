module.exports = (env) ->
	Promise = env.require 'bluebird'
	assert = env.require 'cassert'

	class MjpgPlugin extends env.plugins.Plugin
		init: (app, @framework, @config) =>
			deviceConfigDef = require("./device-config-schema.coffee")
			@framework.deviceManager.registerDeviceClass("MjpgDevice",{
				configDef : deviceConfigDef.MjpgDevice,
				createCallback : (config) => new MjpgDevice(config)
			})
			@framework.on "after init", =>
				mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
				if mobileFrontend?
					mobileFrontend.registerAssetFile 'js', "pimatic-mjpg/app/MjpgTempl-page.coffee"
					mobileFrontend.registerAssetFile 'html', "pimatic-mjpg/app/MjpgTempl-template.html"

	class MjpgDevice extends env.devices.Device

		template: 'mjpg'

		constructor: (@config) ->
			@id = @config.id
			@name = @config.name
			super()

		destroy: ->
			super

	return new MjpgPlugin()
