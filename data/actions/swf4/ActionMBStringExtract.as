﻿package swf.data.actions.swf4
{
	import swf.data.actions.*;

	class ActionMBStringExtract extends Action implements IAction
	{
		public static inline var CODE:Int = 0x35;

		public function ActionMBStringExtract(code:Int, length:Int, pos:Int) {
			super(code, length, pos);
		}

		override public function toString(indent:Int = 0):String {
			return "[ActionMBStringExtract]";
		}
	}
}
