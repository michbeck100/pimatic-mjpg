module.exports = {
	title: "pimatic-mjpg"
	MjpgDevice :
		title: "Plugin Properties"
		type: "object"
		extensions: ["xLink"]
		properties:
			cameraUrl:
				description: "URL of mjpg stream"
				type: "string"
}
