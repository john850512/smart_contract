pragma solidity ^0.4.21;
// Document: https://solidity.readthedocs.io/en/v0.4.24/units-and-global-variables.html
// 第四個智能合約：亂數
contract Random{
    // 以下亂數都不是全亂數，是可以被礦工控制的
    // return block height
    function getBlockNum() constant public returns(uint) {
        return block.number;
    }
    
    // return unix time
    function getNow() constant public returns(uint) {
        return now;
    }

    function getNow2() constant public returns(uint) {
        return block.timestamp;
    }
    
    function randNow(uint min, uint max) public constant returns(uint) {
        return (getNow() % (max-min)) + min;
    }
    
    function randHash(uint min, uint max) public constant returns(uint) {
        // hash function of 256 bits
        bytes32 hash = keccak256(getNow());
        return (uint(hash) % (max - min)) + min; 
    }
}