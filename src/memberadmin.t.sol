pragma solidity >=0.5.15 <0.6.0;

import "ds-test/test.sol";

import "./memberadmin.sol";

contract memberadminTest is DSTest {
    MemberAdmin memberAdmin;

    function setUp() public {
        memberAdmin = new MemberAdmin();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
