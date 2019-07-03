package why.color;

@:forward
abstract Rgb(Base) from Base to Base {
	public static var BLACK = new Rgb(0, 0, 0);
	public static var WHITE = new Rgb(1, 1, 1);
	public static var RED = new Rgb(1, 0, 0);
	public static var GREEN = new Rgb(0, 1, 0);
	public static var BLUE = new Rgb(0, 0, 1);
	
	public var luminance(get, never):Float;
	public var r(get, never):Float;
	public var g(get, never):Float;
	public var b(get, never):Float;
	
	inline function get_luminance() return r * 0.2126 + g * 0.7152 + b * 0.0722;
	inline function get_r() return this.v1;
	inline function get_g() return this.v2;
	inline function get_b() return this.v3;
	
	public inline function new(r, g, b) this = new Base(r, g, b);
	
	public static function fromHsv(h:Float, s:Float, v:Float):Rgb {
		var i = Std.int(h * 6);
		var f = h * 6 - i;
		var p = v * (1 - s);
		var q = v * (1 - f * s);
		var t = v * (1 - (1 - f) * s);
		
		return 
			if(i == 0) new Rgb(v, t, p);
			else if(i == 1) new Rgb(q, v, p);
			else if(i == 2) new Rgb(p, v, t);
			else if(i == 3) new Rgb(p, q, v);
			else if(i == 4) new Rgb(t, p, v);
			else new Rgb(v, p, q);
	}
	
	@:op(A==B) public inline function eq(other:Rgb) return r == other.r && g == other.g && b == other.b;
	@:op(A!=B) public inline function neq(other:Rgb) return !eq(other);
	
	public inline function toHex():String return '#' + hex(r) + hex(g) + hex(b);
	inline static function hex(v:Float) return StringTools.hex(Math.round(v * 255), 2);
	
	#if react_native
	@:to public inline function toReactNativeColor():react.native.component.props.Color return toHex();
	#end
}