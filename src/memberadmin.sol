// Copyright (C) 2020 Centrifuge
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity >=0.5.15 <0.6.0;

import "tinlake-auth/auth.sol";

interface MemberListLike{
     function update(address usr, uint validUntil) external;
     function update(address[] memory users, uint valueUntil) external;
}

// Wrapper contract for permission restriction on the assessor.
// This contract ensures that only the maxReserve size of the pool can be set
contract MemberAdmin is Auth {
    constructor() public {
        wards[msg.sender] = 1;
    }

    // Admins can manipulate memberlists
    mapping (address => uint) public admins;
    function relyAdmin(address usr) public auth note { admin[usr] = 1; }
    function denyAdmin(address usr) public auth note { admin[usr] = 0; }
    modifier admin { require(admin[msg.sender] == 1); _; }

    function update(address list, address usr, uint value) public external admin {
        MemberListLike(list).update(usr, value)
    }
    function update(address list, address[] memory users, uint valueUntil) external admin {
        MemberListLike(list).update(users, value)
    }

}

