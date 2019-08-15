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
	
	@:op(A==B) public inline function eq(other:Rgb) return this.eq(other);
	@:op(A!=B) public inline function neq(other:Rgb) return !eq(other);
	
	public inline function asInt():Int return (int(r) << 16) | (int(g) << 8) | int(b);
	public inline function toHex():String return StringTools.hex(asInt(), 6);
	static inline function int(v:Float):Int return Math.round(v * 255);
	
	#if react_native
	@:to public inline function toReactNativeColor():react.native.component.props.Color return '#' + toHex();
	#end
}