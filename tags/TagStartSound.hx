package swf.tags;

import swf.SWFData;
import swf.data.SWFSoundInfo;

class TagStartSound implements ITag
{
	public static inline var TYPE:Int = 15;

	public var type(default, null):Int;
	public var name(default, null):String;
	public var version(default, null):Int;
	public var level(default, null):Int;
	public var soundId:Int;
	public var soundInfo:SWFSoundInfo;

	public function new()
	{
		type = TYPE;
		name = "StartSound";
		version = 1;
		level = 1;
	}

	public function parse(data:SWFData, length:Int, version:Int, async:Bool = false):Void
	{
		soundId = data.readUI16();
		soundInfo = data.readSOUNDINFO();
	}

	public function publish(data:SWFData, version:Int):Void
	{
		var body:SWFData = new SWFData();
		body.writeUI16(soundId);
		body.writeSOUNDINFO(soundInfo);
		data.writeTagHeader(type, body.length);
		data.writeBytes(body);
	}

	public function toString(indent:Int = 0):String
	{
		var str:String = Tag.toStringCommon(type, name, indent) + "SoundID: " + soundId + ", " + "SoundInfo: " + soundInfo;
		return str;
	}
}
