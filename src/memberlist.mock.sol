pragma solidity >=0.5.15 <0.6.0;

import "tinlake/mock/mock.sol";

contract MemberlistMock is Mock {
    function updateMember(address usr, uint256 validUntil) public {
      calls["updateMember"]++;
      values_address["updateMember_usr"] = usr;
      values_uint["updateMember_validUntil"] = validUntil;
    }
}
