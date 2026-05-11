package swf.exporters.animate;
import lime.media.AudioBuffer;

import lime.app.Future;
import lime.app.Promise;
import lime.media.vorbis.VorbisFile;
import lime.net.HTTPRequest;
import haxe.io.Bytes;

#if lime_howlerjs
import lime.media.howlerjs.Howl;
#end

#if (js && html5)
import js.html.Audio;
#elseif flash
import flash.media.Sound;
import flash.net.URLRequest;
#end
/**
 * ...
 * @author ...
 */
class AnimateAudioBuffer extends AudioBuffer
{

	public function new() 
	{
		super();
	}
	
	public static function loadFromBytes(bytes:Bytes, path:String):Future<AudioBuffer>
	{
		#if (flash || (js && html5))
		var promise = new Promise<AudioBuffer>();

		var audioBuffer = AudioBuffer.fromBytes(bytes);

		if (audioBuffer != null)
		{
			#if flash
			audioBuffer.__srcSound.addEventListener(flash.events.Event.COMPLETE, function(event)
			{
				promise.complete(audioBuffer);
			});

			audioBuffer.__srcSound.addEventListener(flash.events.ProgressEvent.PROGRESS, function(event)
			{
				promise.progress(Std.int(event.bytesLoaded), Std.int(event.bytesTotal));
			});

			audioBuffer.__srcSound.addEventListener(flash.events.IOErrorEvent.IO_ERROR, promise.error);
			#elseif (js && html5 && lime_howlerjs)
			if (audioBuffer != null)
			{
				audioBuffer.__srcHowl.on("load", function()
				{
					promise.complete(audioBuffer);
				});

				audioBuffer.__srcHowl.on("loaderror", function(id, msg)
				{
					promise.error(msg);
				});

				audioBuffer.__srcHowl.load();
			}
			#else
			promise.complete(audioBuffer);
			#end
		}
		else
		{
			promise.error(null);
		}

		return promise.future;
		#else
		// TODO: Streaming

		var request = new HTTPRequest<AudioBuffer>();
		return request.load(path).then(function(buffer)
		{
			if (buffer != null)
			{
				return Future.withValue(buffer);
			}
			else
			{
				return cast Future.withError("");
			}
		});
		#end
	}
	
}