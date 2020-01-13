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
		asserts.assert(color.toInt() == int);
		asserts.assert(color.toHex() == hex);
		return asserts.done();
	}
	
	@:variant(0x00, 0x00, 0x00, 0x000000, '000000')
	@:variant(0xFF, 0xFF, 0xFF, 0xFFFFFF, 'FFFFFF')
	@:variant(0xFF, 0x00, 0x00, 0xFF0000, 'FF0000')
	@:variant(0x00, 0xFF, 0x00, 0x00FF00, '00FF00')
	@:variant(0x00, 0x00, 0xFF, 0x0000FF, '0000FF')
	@:variant(0x12, 0x34, 0x56, 0x123456, '123456')
	public function int8(r:Int, g:Int, b:Int, int:Int, hex:String) {
		var color = Rgb.fromInt8(r, g, b);
		asserts.assert(color.toInt() == int);
		asserts.assert(color.toHex() == hex);
		return asserts.done();
	}
	
	@:variant(0x000000, 0x000000, '000000')
	@:variant(0xFFFFFF, 0xFFFFFF, 'FFFFFF')
	@:variant(0xFF0000, 0xFF0000, 'FF0000')
	@:variant(0x00FF00, 0x00FF00, '00FF00')
	@:variant(0x0000FF, 0x0000FF, '0000FF')
	@:variant(0x123456, 0x123456, '123456')
	public function int24(v:Int, int:Int, hex:String) {
		var color = Rgb.fromInt24(v);
		asserts.assert(color.toInt() == int);
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