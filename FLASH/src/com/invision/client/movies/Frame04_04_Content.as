package com.invision.client.movies 
{
	import com.invision.Core;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Frame04_04_Content extends MovieClip 
	{
		
		public var brannock_piece_width:MovieClip;
		public var hitarea1_mc:Sprite;
		
		private var _sliderRectangle:Rectangle;
		
		public function Frame04_04_Content() {
			trace("Frame04_04_Content");
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
			trace("initializeSlider");
			//initializeSlider();
		}
		
		public function initializeSlider():void {
			_sliderRectangle = new Rectangle(373, 140, 0, 91);
			
			brannock_piece_width.buttonMode = true;
			brannock_piece_width.useHandCursor = true;
			brannock_piece_width.addEventListener(MouseEvent.MOUSE_DOWN, onSliderMouseDownHandler, false, 0, true);
			
			hitarea1_mc.buttonMode = true;
			hitarea1_mc.useHandCursor = true;
			hitarea1_mc.addEventListener(MouseEvent.MOUSE_UP, onIncorrectAnswerHandler, false, 0, true);
			stop();
		}
		
		private function onIncorrectAnswerHandler(mouseevent:MouseEvent):void {
			gotoAndStop("incorrect");
		}
		
		private function onSliderMouseDownHandler(mouseevent:MouseEvent):void {
			//brannock_piece_width.startDrag();
			brannock_piece_width.startDrag(false, _sliderRectangle);
			stage.addEventListener(MouseEvent.MOUSE_UP, onSliderMouseUp, false, 0, true);
		}
		
		private function onSliderMouseUp(mouseevent:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, onSliderMouseUp);
			brannock_piece_width.stopDrag();
			evaluateAnswer();
		}
		
		private function evaluateAnswer():void {
			if (brannock_piece_width.y == 140) {
				gotoAndStop("correct");
				Core.getInstance().getScene().setVisited();
				Core.Modules.updateCompletionBookmark();
			}else {
				gotoAndStop("incorrect");
			}
		}
		
	}

}