package swf.exporters.animate;

import openfl.media.Sound;
import lime.media.AudioBuffer;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class AnimateSoundSymbol extends AnimateSymbol
{
	public var path:String;
	public var sound:Sound;

	public function new()
	{
		super();
	}

	private override function __createObject(library:AnimateLibrary):Sound
	{
		#if lime
		sound = Sound.fromAudioBuffer(AudioBuffer.fromBytes(library.getBytes(path)));
		return sound;
		#else
		return null;
		#end
	}
}
