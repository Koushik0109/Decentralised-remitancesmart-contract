pragma solidity ^0.8.0;

contract Remittance {
    mapping(address => uint256) public balances;
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0 or negative value");
        balances[msg.sender] += msg.value;
    }

    function transfer(address payable _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        balances[msg.sender] -= _amount;
        _to.transfer(_amount);
        emit Transfer(msg.sender, _to, _amount);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}