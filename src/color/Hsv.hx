package color;

@:forward
abstract Hsv(Base) from Base to Base {
	public static var BLACK = new Hsv(0, 1, 0);
	public static var WHITE = new Hsv(0, 0, 1);
	
	
	public var luminance(get, never):Float;
	public var h(get, never):Float;
	public var s(get, never):Float;
	public var v(get, never):Float;
	
	inline function get_luminance() return toRgb().luminance;
	inline function get_h() return this.v1;
	inline function get_s() return this.v2;
	inline function get_v() return this.v3;
	
	public inline function new(h, s, v) this = new Base(h, s, v);
	
	public static function fromRgb(r:Float, g:Float, b:Float):Hsv {
		var cmax = Math.max(r, Math.max(g, b));
		var cmin = Math.min(r, Math.min(g, b));
		var dc = cmax - cmin;
		
		var h = 
			if(dc == 0) 0;
			else if(cmax == r) (((g - b) / dc) % 6) / 6;
			else if(cmax == g) (((b - r) / dc) + 2) / 6;
			else (((r - g) / dc) + 4) / 6;
			
		if(h < 0) h += 1;
		
		return new Hsv(h, cmax == 0 ? 0 : dc / cmax, cmax);
	}
	
	@:op(A==B) public inline function eq(other:Hsv) return h == other.h && s == other.s && v == other.v;
	@:op(A!=B) public inline function neq(other:Hsv) return !eq(other);
	
	public inline function toRgb() return Rgb.fromHsv(h, s, v);
	public inline function toHex() return toRgb().toHex();
	
	#if react_native
	@:to public inline function toReactNativeColor():react.native.component.props.Color return toHex();
	#end
}