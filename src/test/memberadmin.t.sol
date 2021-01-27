pragma solidity >=0.5.15 <0.6.0;

import "ds-test/test.sol";

import "../memberadmin.sol";
import "./memberlist.mock.sol";

contract MemberAdminTest is DSTest {
    MemberAdmin memberAdmin;
    MemberlistMock memberlist;

    function setUp() public {
        memberAdmin = new MemberAdmin();
        memberlist = new MemberlistMock();
    }

    function test_updateMemberAsAdmin() public {
        memberAdmin.relyAdmin(address(this));

        address usr = 0x0A735602a357802f553113F5831FE2fbf2F0E2e0;
        uint validUntil = now + 365 days;
        memberAdmin.updateMember(address(memberlist), usr, validUntil);

        assertEq(memberlist.calls("updateMember"), 1);
        assertEq(memberlist.values_address("updateMember_usr"), usr);
        assertEq(memberlist.values_uint("updateMember_validUntil"), validUntil);
    }

    function testFail_updateMemberAsNonAdmin() public {
        memberAdmin.denyAdmin(address(this));

        address usr = 0x0A735602a357802f553113F5831FE2fbf2F0E2e0;
        uint validUntil = now + 365 days;
        memberAdmin.updateMember(address(memberlist), usr, validUntil);

        assertEq(memberlist.calls("updateMember"), 1);
        assertEq(memberlist.values_address("updateMember_usr"), usr);
        assertEq(memberlist.values_uint("updateMember_validUntil"), validUntil);
    }
}