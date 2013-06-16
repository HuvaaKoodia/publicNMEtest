package utils;

/**
 * ...
 * @author HuvaaKoodia
 */
class Subs
{
	public static inline function Random(max:Int, min:Int=0) {
		return min + Std.random(max-min);
	}
}