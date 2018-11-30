pragma solidity ^0.4.2;

contract WCCToken {
    // Constructor
    // Set the total number of tokens
    // Read the total number of tokens

    // Name
    string public name = "WCC Token";
    string public symbol = "WCC";
    string public standard = "WCC Token v.1";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // transfer
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    // allowance
    mapping(address => mapping(address => uint256)) public allowance;


    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;        
        // allocate the initial supply
    }

    // Transfer
    function transfer(address _to, uint _value) public returns (bool success) {
        
        // Exception if account doesn't have enough
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Transfer Event
        Transfer(msg.sender, _to, _value);

        return true;
        // Return a boolean
        
    }

    // approve
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        Transfer(_from, _to, _value);

        return true;

    }
    // transfer to
    
}