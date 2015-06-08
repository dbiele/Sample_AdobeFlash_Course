package com.invision.client.movies 
{
	import com.invision.client.components.BasicButton;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ken alderfer
	 */
	public class did_you_know extends MovieClip 
	{
		public var dyk_btn_openMe:MovieClip;
		public var dyk_btn_closeMe:MovieClip;
		private var openBasicButton:BasicButton;
		private var closeBasicButton:BasicButton;
		
		public function did_you_know() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage, false, 0, true);
		}
		private function onAddToStage(event:Event):void {
			openBasicButton = new BasicButton("dykOpen", dyk_btn_openMe);
			openBasicButton.addEventListener(MouseEvent.MOUSE_UP, onOpenWindow, false, 0, true);
		}
		private function onOpenWindow(event:MouseEvent):void {
			openBasicButton.removeEventListener(MouseEvent.MOUSE_UP, onOpenWindow);
			gotoAndPlay("openBubble");
		}
		public function waitForClose():void {
			closeBasicButton = new BasicButton("dykClose", dyk_btn_closeMe);
			closeBasicButton.addEventListener(MouseEvent.MOUSE_UP, onCloseWindow, false, 0, true);
		}
		private function onCloseWindow(event:MouseEvent):void {
			closeBasicButton.removeEventListener(MouseEvent.MOUSE_UP, onCloseWindow);
			gotoAndPlay("closeBubble");
		}
	}

}