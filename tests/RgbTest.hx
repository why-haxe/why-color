package;

import why.color.*;
import tink.unit.Assert.*;

@:asserts
class RgbTest {
	public function new() {}
	
	@:variant(why.color.Rgb.BLACK, 0x000000, '000000')
	@:variant(why.color.Rgb.WHITE, 0xFFFFFF, 'FFFFFF')
	@:variant(why.color.Rgb.RED, 0xFF0000, 'FF0000')
	@:variant(why.color.Rgb.GREEN, 0x00FF00, '00FF00')
	@:variant(why.color.Rgb.BLUE, 0x0000FF, '0000FF')
	public function const(color:Rgb, int:Int, hex:String) {
		asserts.assert(color.asInt() == int);
		asserts.assert(color.toHex() == hex);
		return asserts.done();
	}
	
	public function eq() {
		asserts.assert(new Rgb(1, 0, 0.5) == new Rgb(1, 0, 0.5));
		return asserts.done();
	}
	
	public function neq() {
		asserts.assert(new Rgb(1, 0, 0.5) != new Rgb(1, 0, 1));
		return asserts.done();
	}
}