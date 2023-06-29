// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FizzBuzz.sol";

contract FizzBuzzTest is Test {
    FizzBuzz internal fizzbuzz;

    function setUp() public {
        fizzbuzz = new FizzBuzz();
    }

    function test_returns_fizz_when_divisible_by_three() public {
        assertEq(fizzbuzz.fizzbuzz(3), "fizz");
        assertEq(fizzbuzz.fizzbuzz(6), "fizz");
        assertEq(fizzbuzz.fizzbuzz(27), "fizz");
    }

    function test_returns_buzz_when_divisible_by_five() public {
        assertEq(fizzbuzz.fizzbuzz(5), "buzz");
        assertEq(fizzbuzz.fizzbuzz(10), "buzz");
        assertEq(fizzbuzz.fizzbuzz(175), "buzz");
    }

    function test_returns_fizzbuzz_when_divisible_by_three_and_five() public {
        assertEq(fizzbuzz.fizzbuzz(15), "fizzbuzz");
    }

}
