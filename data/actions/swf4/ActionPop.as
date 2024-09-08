﻿package swf.data.actions.swf4
{
	import swf.data.actions.*;

	class ActionPop extends Action implements IAction
	{
		public static inline var CODE:Int = 0x17;

		public function ActionPop(code:Int, length:Int, pos:Int) {
			super(code, length, pos);
		}

		override public function toString(indent:Int = 0):String {
			return "[ActionPop]";
		}
	}
}
