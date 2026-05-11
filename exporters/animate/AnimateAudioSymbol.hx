package swf.exporters.animate;

import openfl.media.Sound;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:keepSub class AnimateAudioSymbol
{
	public var className:String;
	public var id:Int;

	public function new() {}

	private function __createObject(library:AnimateLibrary):Sound
	{
		return null;
	}

	private function __init(library:AnimateLibrary):Void {}

	private function __initObject(library:AnimateLibrary, instance:Sound):Void {}
}
