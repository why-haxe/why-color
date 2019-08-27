package why.color;

@:forward @:observable
abstract Rgb(Base) from Base to Base {
	public static var BLACK = new Rgb(0, 0, 0);
	public static var WHITE = new Rgb(1, 1, 1);
	public static var RED = new Rgb(1, 0, 0);
	public static var GREEN = new Rgb(0, 1, 0);
	public static var BLUE = new Rgb(0, 0, 1);
	
	public var luminance(get, never):Value;
	public var r(get, never):Value;
	public var g(get, never):Value;
	public var b(get, never):Value;
	
	inline function get_luminance() return r * 0.2126 + g * 0.7152 + b * 0.0722;
	inline function get_r() return this.v1;
	inline function get_g() return this.v2;
	inline function get_b() return this.v3;
	
	public inline function new(r, g, b) this = new Base(r, g, b);
	
	@:op(A==B) public inline function eq(other:Rgb) return this.eq(other);
	@:op(A!=B) public inline function neq(other:Rgb) return !eq(other);
	
	public inline function toInt():Int return (r.toInt8() << 16) | (g.toInt8() << 8) | b.toInt8();
	public inline function toHex():String return StringTools.hex(toInt(), 6);
	
	#if react_native
	@:to public inline function toReactNativeColor():react.native.component.props.Color return '#' + toHex();
	#end
}