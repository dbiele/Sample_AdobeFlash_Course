package com.invision.client.movies 
{
	import com.invision.client.components.BasicButton;
	import com.invision.Core;
	import com.invision.CoreConstants;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Dean Biele
	 */
	public class Frame01_Content extends MovieClip 
	{
		
		public var nb101_mc:MovieClip;
		public var btn_yes:MovieClip
		public var btn_no:MovieClip;
		public var frame01_shoe:Sprite;
		
		private var basicButtonYes:BasicButton
		private var basicButtonNo:BasicButton
		
		public function Frame01_Content() 
		{
			trace("Frame01_Content called");
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage, false, 0, true);
			if (stage) {
				initialize();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}
		}
		
		private function onRemoveFromStage(event:Event):void {
			trace("on removed from stage special packs intro frame7_mc");
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			gotoAndStop(1);
			delete(this);
		}		
		
		private function initialize(event:Event = null):void {
			trace("initialize called");
			basicButtonYes = new BasicButton("introyes", btn_yes);
			basicButtonYes.addEventListener(MouseEvent.MOUSE_UP, onYesHandler, false, 0, true);
			
			basicButtonNo = new BasicButton("introno", btn_no);
			basicButtonNo.addEventListener(MouseEvent.MOUSE_UP, onNoHandler, false, 0, true);
			stop()
		}
		
		private function onYesHandler(mouseevent:MouseEvent):void {
			Core.CourseObject.Nav.showOverlay(CoreConstants.CONTROL_ID_HELP, "helpWindow");
		}
		
		private function onNoHandler(mouseevent:MouseEvent):void {
			Core.CourseObject.Nav.onNextButton();
		}
	}

}