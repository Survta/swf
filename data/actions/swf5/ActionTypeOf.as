﻿package swf.data.actions.swf5
{
	import swf.data.actions.*;

	class ActionTypeOf extends Action implements IAction
	{
		public static inline var CODE:Int = 0x44;

		public function ActionTypeOf(code:Int, length:Int, pos:Int) {
			super(code, length, pos);
		}

		override public function toString(indent:Int = 0):String {
			return "[ActionTypeOf]";
		}
	}
}
