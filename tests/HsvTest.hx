package;

import why.color.*;
import tink.unit.Assert.*;

@:asserts
class HsvTest {
	public function new() {}
	
	@:variant(why.color.Hsv.BLACK, 0x000000, '000000')
	@:variant(why.color.Hsv.WHITE, 0xFFFFFF, 'FFFFFF')
	@:variant(why.color.Hsv.RED, 0xFF0000, 'FF0000')
	@:variant(why.color.Hsv.GREEN, 0x00FF00, '00FF00')
	@:variant(why.color.Hsv.BLUE, 0x0000FF, '0000FF')
	public function const(color:Hsv, int:Int, hex:String) {
		asserts.assert(color.toRgb().asInt() == int);
		asserts.assert(color.toRgb().toHex() == hex);
		return asserts.done();
	}
	
	public function eq() {
		asserts.assert(new Hsv(1, 0, 0.5) == new Hsv(1, 0, 0.5));
		return asserts.done();
	}
	
	public function neq() {
		asserts.assert(new Hsv(1, 0, 0.5) != new Hsv(1, 0, 1));
		return asserts.done();
	}
}