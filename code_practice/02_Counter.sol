pragma solidity ^0.4.25;

//第二個智能合約：加減器
contract Counter{
    uint data;

    // constant跟view是一樣的東西，代表不會對區塊鏈上的資料做任何修改
    function get() public view returns(uint) {
        return data;
    }
    
    function increment() public {
        data = data + 1;
    }
    
    // 如果data=0再減1就會變成2^256 - 1(uint是預設是256bits)
    // 會有什麼問題？如果你沒有錢了別人又跟妳拿1元，你就會變超級有錢
    function decrement() public {
        data = data - 1;
    }
}
