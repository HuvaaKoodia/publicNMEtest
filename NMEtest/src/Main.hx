package ;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import nme.Assets;
import nme.display.Bitmap;
import objects.O1;
import utils.Key;

import nme.events.MouseEvent;
import nme.events.KeyboardEvent;
import nme.events.TextEvent;
/**
 * ...
 * @author HuvaaKoodia
 */

class Main extends Sprite 
{
	var inited:Bool;
	var stepTime:Int;
	var timeMulti:Float = 1;

	/* ENTRY POINT */
	
	var background:Bitmap;
	
	var Objects:List<O1>;
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
		background.width = stage.stageWidth;
		background.height = stage.stageHeight;
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		background = new Bitmap( Assets.getBitmapData("img/bg.png"));
		
		//background.height = stage.height;
		//background.width= stage.width;
		
		resize(null);
		
		addChild(background);
		
		Objects = new List<O1>();
		
		var o1 = new O1();
		Objects.add(o1);
		addChild(o1);
		
		
		pressed_list =new List<Int>();
	}

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
		addEventListener(Event.ENTER_FRAME, this_onEnterFrame);

		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
				
		Lib.current.addChild(new Main());
	}

	private function this_onEnterFrame (event:Event):Void {
		
		var dt:Float = (Lib.getTimer () - stepTime) / (1000);
		stepTime = Lib.getTimer(); 
		
		for (o in Objects) {
			o.step(dt*timeMulti);
		}
		
		if (isKeyDown(Key.A)) {
			trace("A pressed");
		}
		//trace("list size: "+pressed_list.length);
	}
	
	//DEV move to input system
	private var pressed_list:List<Int>;
	
	private function onKeyDown(e:KeyboardEvent) {
		if (!Lambda.has(pressed_list,e.keyCode))
			pressed_list.push(e.keyCode);
	}
	
	
	private function onKeyUp(e:KeyboardEvent) {
		//trace("Released!");
		pressed_list.remove(e.keyCode);
	}
	
	private function isKeyDown(key:Int) {
		return Lambda.exists(pressed_list, function(k) { return cast(k,Int) == key;});
	}
}
