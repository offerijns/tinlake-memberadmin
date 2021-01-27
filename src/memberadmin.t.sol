pragma solidity >=0.5.15 <0.6.0;

import "ds-test/test.sol";

import "./memberadmin.sol";
import "./memberlist.mock.sol";

contract memberadminTest is DSTest {
    MemberAdmin memberAdmin;
    MemberlistMock memberlist;

    function setUp() public {
        memberAdmin = new MemberAdmin();
        memberlist = new MemberlistMock();
    }

    function test() public {
        usr = "0x0";
        validUntil = now + 365 days;
        memberAdmin.updateMember(address(memberlist), usr, validUntil)

        assertEq(memberlist.calls("updateMember"), 1);
        assertEq(sub.values_address("updateMember_usr"), usr);
        assertEq(sub.values_uint("updateMember_validUntil"), validUntil);
    }
