package com.invision.client.movies 
{
	import com.greensock.TweenLite;
	import com.invision.assessment.MultipleChoiceQuestion;
	import com.invision.Core;
	import com.invision.CoreConstants;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Frame_Assessment_07 extends MovieClip 
	{
		
		public var hitarea1_mc:Sprite;
		public var hitarea2_mc:Sprite;
		public var hitarea3_mc:Sprite;
		
		public var highlight1_mc:Sprite;
		public var highlight2_mc:Sprite;
		public var highlight3_mc:Sprite;
		
		private var _currentSelectionNum:int;
		private var mQuestion:MultipleChoiceQuestion;
		
		public function Frame_Assessment_07()
		{
			if (stage) {
				initialize();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, initialize, false, 0, true);
			}
		}
		
		private function initialize(event:Event = null) {
			highlight1_mc.alpha = 0;
			highlight2_mc.alpha = 0;
			highlight3_mc.alpha = 0;
			addButtonHandlers();
			mQuestion = MultipleChoiceQuestion(Core.Modules.getQuestion(Core.getInstance().getScene().getID()));
			if (Core.Modules.AssessmentModule.isInProgress() && mQuestion.getResponse() != CoreConstants.UNDEFINED) {    
                getSavedAnswers();
			}
		}
		
		private function addButtonHandlers():void {
			hitarea1_mc.buttonMode = true;
			hitarea1_mc.useHandCursor = true;
			hitarea1_mc.addEventListener(MouseEvent.ROLL_OVER, onHitArea1RollOver, false, 0, true);
			hitarea1_mc.addEventListener(MouseEvent.ROLL_OUT, onHitArea1RollOut, false, 0, true);
			hitarea1_mc.addEventListener(MouseEvent.MOUSE_UP, onHitArea1Handler, false, 0, true);
			
			hitarea2_mc.buttonMode = true;
			hitarea2_mc.useHandCursor = true;
			hitarea2_mc.addEventListener(MouseEvent.ROLL_OVER, onHitArea2RollOver, false, 0, true);
			hitarea2_mc.addEventListener(MouseEvent.ROLL_OUT, onHitArea2RollOut, false, 0, true);
			hitarea2_mc.addEventListener(MouseEvent.MOUSE_UP, onHitArea2Handler, false, 0, true);
			
			hitarea3_mc.buttonMode = true;
			hitarea3_mc.useHandCursor = true;
			hitarea3_mc.addEventListener(MouseEvent.ROLL_OVER, onHitArea3RollOver, false, 0, true);
			hitarea3_mc.addEventListener(MouseEvent.ROLL_OUT, onHitArea3RollOut, false, 0, true);
			hitarea3_mc.addEventListener(MouseEvent.MOUSE_UP, onHitArea3Handler, false, 0, true);
		}
		
		private function onHitArea1Handler(mouseevent:MouseEvent):void {
			selectHitArea(1);
		}
		
		private function onHitArea2Handler(mouseevent:MouseEvent):void {
			selectHitArea(2);
		}
		
		private function onHitArea3Handler(mouseevent:MouseEvent):void {
			selectHitArea(3);
		}		
		
		private function onHitArea1RollOver(mouseevent:MouseEvent):void {
			rolloverHitArea(1);
		}
		
		private function onHitArea2RollOver(mouseevent:MouseEvent):void {
			rolloverHitArea(2);
		}
		
		private function onHitArea3RollOver(mouseevent:MouseEvent):void {
			rolloverHitArea(3);
		}
		
		private function onHitArea1RollOut(mouseevent:MouseEvent):void {
			rolloutHitArea(1);
		}
		
		private function onHitArea2RollOut(mouseevent:MouseEvent):void {
			rolloutHitArea(2);
		}
		
		private function onHitArea3RollOut(mouseevent:MouseEvent):void {
			rolloutHitArea(3);
		}
		
		private function selectHitArea(selectionNum:int):void {
			if (_currentSelectionNum != selectionNum) {
				trace("selectionNum = " + ("selection"+selectionNum));
				mQuestion.setResponse("selection" + selectionNum);
				trace("_currentSelectionNum = " + _currentSelectionNum);
				if (_currentSelectionNum != 0) {
					trace("_currentSelectionNum = " + _currentSelectionNum);
					mQuestion.removeResponse("selection" + _currentSelectionNum);
				}
				fadeIn(selectionNum);
				fadeOut(_currentSelectionNum);
				_currentSelectionNum = selectionNum;
			}
		}
		
        public function getSavedAnswers() {
			trace("getSavedAnswers");
            var answerKeys:Array = mQuestion.getChoices();
            for (var i:Number = 0; i < answerKeys.length; i++) {
                //loop thru all answers
				trace("loop thru");
                var answerID:String = answerKeys[i];
                if(mQuestion.wasResponseChosen(answerID) == 1){
                    // the user selected this answer
					trace("fade in = " + (i + 1));
					_currentSelectionNum = (i + 1);
					fadeIn(i+1);
                }
            }			
        }
		
		private function rolloverHitArea(selectionNum:int):void {
			if (_currentSelectionNum != selectionNum) {
				fadeIn(selectionNum,0.45);
			}
		}
		
		private function rolloutHitArea(selectionNum:int):void {
			if (_currentSelectionNum != selectionNum) {
				fadeOut(selectionNum);
			}			
		}
		
		private function fadeIn(selectionNum:int, alphaNum:Number = 1):void {
			switch(selectionNum) {
				case 1:
					TweenLite.to(highlight1_mc, 0.5, {alpha:alphaNum } );
					break;
				case 2:
					TweenLite.to(highlight2_mc, 0.5, {alpha:alphaNum } );
					break;
				case 3:
					TweenLite.to(highlight3_mc, 0.5, {alpha:alphaNum } );
					break;
			}			
		}
		
		private function fadeOut(selectionNum:int):void {
			switch(selectionNum) {
				case 1:
					TweenLite.to(highlight1_mc, 0.5, {alpha:0 } );
					break;
				case 2:
					TweenLite.to(highlight2_mc, 0.5, {alpha:0 } );
					break;
				case 3:
					TweenLite.to(highlight3_mc, 0.5, {alpha:0 } );
					break;
			}				
		}
		
	}

}