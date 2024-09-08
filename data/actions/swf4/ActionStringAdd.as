﻿package swf.data.actions.swf4
{
	import swf.data.actions.*;

	class ActionStringAdd extends Action implements IAction
	{
		public static inline var CODE:Int = 0x21;

		public function ActionStringAdd(code:Int, length:Int, pos:Int) {
			super(code, length, pos);
		}

		override public function toString(indent:Int = 0):String {
			return "[ActionStringAdd]";
		}
	}
}
