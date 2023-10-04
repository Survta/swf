package swf.timeline;

import swf.utils.StringUtils;

class Scene
{
	public var frameNumber:Int = 0;
	public var labels:Array<String>;
	public var numFrames:Int = 1;
	public var name:String;

	public function new(frameNumber:Int, name:String)
	{
		this.frameNumber = frameNumber;
		this.name = name;
		this.labels = [];
	}

	public function toString(indent:Int = 0):String
	{
		return StringUtils.repeat(indent) + "Name: " + name + ", " + "Frame: " + frameNumber;
	}
}
