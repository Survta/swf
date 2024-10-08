package swf.exporters.animate;

import swf.timeline.SoundStream;
import swf.utils.SymbolUtils;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
//import com.sunwork.LifeSlideMovieClip;
import openfl.display.Scene;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.media.Sound;
import openfl.media.SoundChannel;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(openfl.display.Sprite)
class AnimateSpriteSymbol extends AnimateSymbol
{
	public var baseClassName:String;
	public var frames:Array<AnimateFrame>;
	public var scenes:Array<Scene>;
	public var scale9Grid:Rectangle;
	
	private var soundStream:SoundStream;		
	private var hasSoundStream:Bool;		
	
	private var library:AnimateLibrary;

	public function new()
	{
		super();

		frames = new Array();
		scenes = new Array();
	}

	private function __constructor(sprite:Sprite):Void
	{
		var timeline = new AnimateTimeline(library, this);
		//if (#if (haxe_ver >= 4.2) Std.isOfType #else Std.is #end (sprite, LifeSlideMovieClip))
		if (#if (haxe_ver >= 4.2) Std.isOfType #else Std.is #end (sprite, MovieClip))
		{
			var movieClip:MovieClip = cast sprite;
			#if flash
			@:privateAccess cast(movieClip, flash.display.MovieClip.MovieClip2).attachTimeline(timeline);
			#else
			movieClip.scale9Grid = scale9Grid;
			movieClip.attachTimeline(timeline);
			#end
		}
		else
		{
			sprite.scale9Grid = scale9Grid;
			timeline.initializeSprite(sprite);
		}
	}

	private override function __createObject(library:AnimateLibrary):Sprite
	{
		#if !macro
		Sprite.__constructor = __constructor;
		#end
		this.library = library;

		#if flash
		if (className == "flash.display.MovieClip")
		{
			className = "flash.display.MovieClip2";
		}
		#end

		var symbolType = null;

		if (className != null)
		{
			symbolType = Type.resolveClass(SymbolUtils.formatClassName(className));

			if (symbolType == null)
			{
				// Log.warn ("Could not resolve class \"" + className + "\"");
			}
		}

		if (symbolType == null && baseClassName != null)
		{
			#if flash
			if (baseClassName == "flash.display.MovieClip")
			{
				baseClassName = "flash.display.MovieClip2";
			}
			#end

			symbolType = Type.resolveClass(SymbolUtils.formatClassName(baseClassName));

			if (symbolType == null)
			{				
				// Log.warn ("Could not resolve class \"" + className + "\"");
			}
		}

		var sprite:Sprite = null;

		if (symbolType != null)
		{
			sprite = Type.createInstance(symbolType, []);
		}
		else
		{
			#if flash
			sprite = new flash.display.MovieClip.MovieClip2();
			#else
			sprite = new MovieClip();
			#end
		}

		#if flash
		if (!#if (haxe_ver >= 4.2) Std.isOfType #else Std.is #end (sprite, flash.display.MovieClip.MovieClip2))
		{
			sprite.scale9Grid = scale9Grid;
		}
		#end

		return sprite;
	}

	private override function __init(library:AnimateLibrary):Void
	{
		#if !macro
		Sprite.__constructor = __constructor;
		#end
		this.library = library;
	}

	private override function __initObject(library:AnimateLibrary, instance:Dynamic):Void
	{
		this.library = library;
		__constructor(cast instance);
	}
}
