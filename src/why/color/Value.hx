package why.color;

abstract Value(Float) from Float to Float {
	public inline function toInt8():Int return Math.round(this * 255);
	
	@:op(a*b) public function mul(v:Float):Float;
	@:op(a/b) public function div(v:Float):Float;
	@:op(a+b) public function add(v:Float):Float;
	@:op(a-b) public function sub(v:Float):Float;
	@:op(a==b) public function eq(v:Float):Bool;
	@:op(a!=b) public function neq(v:Float):Bool;
	@:op(a>b) public function gt(v:Float):Bool;
	@:op(a<b) public function lt(v:Float):Bool;
	@:op(a>=b) public function gte(v:Float):Bool;
	@:op(a<=b) public function lte(v:Float):Bool;
}