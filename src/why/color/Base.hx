package why.color;

import haxe.ds.Vector;

@:pure
abstract Base(Vector<Value>) {
	public var v1(get, never):Value; inline function get_v1() return this[0];
	public var v2(get, never):Value; inline function get_v2() return this[1];
	public var v3(get, never):Value; inline function get_v3() return this[2];
	
	public function new(v1, v2, v3) {
		this = new Vector(3);
		this[0] = v1;
		this[1] = v2;
		this[2] = v3;
	}
	
	public function eq(other:Base) return v1 == other.v1 && v2 == other.v2 && v3 == other.v3;
}