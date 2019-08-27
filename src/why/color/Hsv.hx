package why.color;

@:forward @:observable
abstract Hsv(Base) from Base to Base {
	public static var BLACK = new Hsv(0, 1, 0);
	public static var WHITE = new Hsv(0, 0, 1);
	public static var RED = new Hsv(0, 1, 1);
	public static var GREEN = new Hsv(1/3, 1, 1);
	public static var BLUE = new Hsv(2/3, 1, 1);
	
	public var luminance(get, never):Value;
	public var h(get, never):Value;
	public var s(get, never):Value;
	public var v(get, never):Value;
	
	inline function get_luminance() return toRgb().luminance;
	inline function get_h() return this.v1;
	inline function get_s() return this.v2;
	inline function get_v() return this.v3;
	
	public inline function new(h, s, v) this = new Base(h, s, v);
	
	public static function hsv2rgb(h:Float, s:Float, v:Float):Rgb {
		var i = Std.int(h * 6);
		var f = h * 6 - i;
		var p = v * (1 - s);
		var q = v * (1 - f * s);
		var t = v * (1 - (1 - f) * s);
		
		return switch i {
			case 0: new Rgb(v, t, p);
			case 1: new Rgb(q, v, p);
			case 2: new Rgb(p, v, t);
			case 3: new Rgb(p, q, v);
			case 4: new Rgb(t, p, v);
			case _: new Rgb(v, p, q);
		}
	}
	
	public static function rgb2hsv(r:Float, g:Float, b:Float):Hsv {
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
	
	@:op(A==B) public inline function eq(other:Hsv) return this.eq(other);
	@:op(A!=B) public inline function neq(other:Hsv) return !eq(other);
	
	@:from public static inline function fromRgb(v:Rgb):Hsv return rgb2hsv(v.r, v.g, v.b);
	@:to public inline function toRgb():Rgb return hsv2rgb(h, s, v);
	
	#if react_native
	@:to public inline function toReactNativeColor():react.native.component.props.Color return toRgb().toReactNativeColor();
	#end
}