﻿package swf.data.actions.swf5
{
	import swf.data.actions.*;

	class ActionDefineLocal2 extends Action implements IAction
	{
		public static inline var CODE:Int = 0x41;

		public function ActionDefineLocal2(code:Int, length:Int, pos:Int) {
			super(code, length, pos);
		}

		override public function toString(indent:Int = 0):String {
			return "[ActionDefineLocal2]";
		}
	}
}
