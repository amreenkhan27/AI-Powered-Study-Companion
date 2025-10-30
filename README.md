// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GreenEnergyToken
 * @dev A simple token contract to promote renewable energy investments.
 */
contract GreenEnergyToken {
    string public name = "Green Energy Token";
    string public symbol = "GET";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => bool) public verifiedProducer;

    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event ProducerVerified(address indexed producer);
    event TokensMinted(address indexed producer, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Verify a renewable energy producer.
     * @param _producer The address of the producer to verify.
     */
    function verifyProducer(address _producer) external onlyOwner {
        verifiedProducer[_producer] = true;
        emit ProducerVerified(_producer);
    }

    /**
     * @dev Mint tokens to verified producers as incentives.
     * @param _amount The number of tokens to mint.
     */
    function mintTokens(uint256 _amount) external {
        require(verifiedProducer[msg.sender], "Not a verified producer");
        balanceOf[msg.sender] += _amount;
        totalSupply += _amount;
        emit TokensMinted(msg.sender, _amount);
    }

    /**
     * @dev Transfer tokens between addresses.
     * @param _to Recipient address.
     * @param _value Amount of tokens to transfer.
     */
    function transfer(address _to, uint256 _value) external returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        require(_to != address(0), "Invalid address");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
// contracts details | 0x3cC9Ae030682d32c706787A6d0524fbb261d8F75
<img width="1573" height="737" alt="image" src="https://github.com/user-attachments/assets/47a2641b-91e6-4b37-a86d-ee428901aa5c" />

