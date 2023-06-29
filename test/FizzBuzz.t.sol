// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FizzBuzz.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract FizzBuzzTest is Test {
    FizzBuzz internal fizzbuzz;

    function setUp() public {
        fizzbuzz = new FizzBuzz();
    }

    function test_returns_fizz_when_divisible_by_three(uint256 n) public {
        vm.assume(n % 3 == 0);
        vm.assume(n % 5 != 0);
        assertEq(fizzbuzz.fizzbuzz(n), "fizz");
    }

    function test_returns_buzz_when_divisible_by_five(uint256 n) public {
        vm.assume(n % 3 != 0);
        vm.assume(n % 5 == 0);
        assertEq(fizzbuzz.fizzbuzz(n), "buzz");
    }

    function test_returns_fizzbuzz_when_divisible_by_three_and_five(uint256 n) public {
        vm.assume(n % 3 == 0);
        vm.assume(n % 5 == 0);
        assertEq(fizzbuzz.fizzbuzz(n), "fizzbuzz");
    }

    function test_returns_number_as_string_otherwise(uint256 n) public {
        vm.assume(n % 3 != 0);
        vm.assume(n % 5 != 0);
        assertEq(fizzbuzz.fizzbuzz(n), Strings.toString(n));
    }

    function prove_returns_fizz_when_divisible_by_three(uint256 n) public {
        if(n % 3 != 0) return;
        if(n % 5 == 0) return;
        assertEq(fizzbuzz.fizzbuzz(n), "fizz");
    }

    function prove_returns_buzz_when_divisible_by_five(uint256 n) public {
        if(n % 3 == 0) return;
        if(n % 5 != 0) return;
        assertEq(fizzbuzz.fizzbuzz(n), "buzz");
    }

    function prove_returns_fizzbuzz_when_divisible_by_three_and_five(uint256 n) public {
        if(n % 3 != 0) return;
        if(n % 5 != 0) return;
        assertEq(fizzbuzz.fizzbuzz(n), "fizzbuzz");
    }
}

