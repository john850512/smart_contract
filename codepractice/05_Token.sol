pragma solidity ^0.4.21;
// 第五個智能合約：建構一個發幣合約
// code: https://gist.github.com/yhuag/b28ab455f8080e81b20a61bec0eb6528
contract Token {
    // 建立帳本
    // map一個adress到一個數字
    // 任何public的變數都會自動產生一個get的funcction() (deploy後可以看到)
    // 如果在javascript vm跑，那暫時只能轉給5個預設的account
    // 現在創立的是全新的幣，暫時還沒有取名字，如果現在轉帳會看到帳戶一堆99.99999....因為那是以太幣的單位
    // 創立的幣不是以太幣（子帳本的概念）
    mapping (address=>uint256) public balances;
    
    // constructor
    constructor(uint256 initialSupply) public {
        //發幣到自己的口袋
        balances[msg.sender] = initialSupply;
    }
    
    //轉帳功能
    function transfer(address _to, uint256 _value) public {
        //轉帳有兩個限制： 1.overflow(對方錢包爆炸了) 2.我錢包沒錢了
        require(balances[msg.sender]>= _value);
        require(balances[_to] + _value >= balances[_to]);
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}