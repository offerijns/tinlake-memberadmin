pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./memberadmin.sol";

contract memberadminTest is DSTest {
    memberadmin memberadmin;

    function setUp() public {
        memberadmin = new memberadmin();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
