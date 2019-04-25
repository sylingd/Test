<?php
namespace SyTest;

use PHPUnit\Framework\TestCase;

class MyTest extends TestCase {
	public function testAll() {
		$this->assertEquals([
			'a' => 1,
			'b' => 2
		], [
			'b' => 2,
			'a' => 1
		]);
	}
}