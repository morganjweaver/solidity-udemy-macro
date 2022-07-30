//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
 
contract KnowledgeTest {
    address public owner;
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    constructor(){
        owner = msg.sender;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint256 _balance){
        return address(this).balance;
    }

    function transferAll(address _to) public onlyOwner returns(bool, bytes memory){
       (bool success, bytes memory returnData) =  _to.call{value: getBalance()}("");
       return (success, returnData);
    }

    function start() external returns (bool) {
        players.push(msg.sender);
        return true;
    }

    function concatenate(string calldata one, string calldata two) public pure returns(string memory){
        return string.concat(one, two);
    }

    receive() external payable {}

    modifier onlyOwner {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }
}
