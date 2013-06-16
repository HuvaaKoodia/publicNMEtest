package utils;

/**
 * ...
 * @author HuvaaKoodia
 */
class Timer
{
	
	public var Time:Float;
	var _timer:Float;
	
	/**
	 * Timer for timing and such.
	 * @param time in millis
	 */
	public function new(time:Float=1000) 
	{
		Time=_timer = time;
	}
	
	public function update(dt:Float) {
		_timer-= dt * 1000;
		if (_timer <= 0) {
			_timer = Time;
			return true;
		}
		return false;
	}
	
}