package objects;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Lib;
import utils.Stats;
import utils.Timer;
import utils.Subs;

/**
 * ...
 * @author HuvaaKoodia
 */

class O1 extends Sprite
{
	var img:Bitmap;
	public function new() 
	{
		super();
		img = new Bitmap(nme.Assets.getBitmapData("img/Untitled.png"));
		addChild(img);
		
		init_ai();
	}
	
	public function step(dt:Float) {
		

		if (ai_state == 0) {
			x++;
		}
		else
		if (ai_state == 1) {
			x--;
		}
		else
		if (ai_state == 2) {
			y++;
		}
		else
		if (ai_state == 3) {
			y--;
		}
		
		if (ai_timer.update(dt)) {
			
			var state = 0;
			do {
				state = Subs.Random(4);
				reset_ai_timer();
			}
			while (state == ai_state);
			
			ai_state = state;
		}
		
		//inside room 
		if (x < 0)
			x = 0;
		if (y < 0)
			y = 0;
		if (x > Stats.ScreenWidth)
			x = Stats.ScreenWidth;
		if (y > Stats.ScreenHeight)
			y = Stats.ScreenHeight;
			
			
		trace(Std.format('x: $x y: $y ai: $ai_state'));
	}
	
	
	
	private var ai_state:Int;
	var ai_timer:Timer;
	
	private function init_ai(){
		ai_state = 0;
		ai_timer = new Timer(0);
		reset_ai_timer();
	}
	
	private function reset_ai_timer() {
		ai_timer.Time = Subs.Random(1000, 100);
	}
	
}