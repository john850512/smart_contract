pragma solidity ^0.4.25;

//引入library
//直接從網址會進不去，可以google safemath
import "github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol"; 

//第三個智能合約：安全加減器(使用別人寫好的library防止overflow)
contract SafeCounter{
    uint data;
    //要給哪個資料型態用
    using SafeMath for uint;
    
    // constant跟view是一樣的東西，代表不會對區塊鏈上的資料做任何修改
    function get() public view returns(uint) {
        return data;
    }
    
    function increment() public {
        //data = data + 1;
        //只有在引入相關的library才能使用這種寫法
        data = data.add(1);
    }

    function decrement() public {
        // 自己做防範，如果data符合條件才會執行
        // require(data>=1);
        // data = data - 1;
        // 或是使用別人寫好的function：
        data = data.sub(1);
    }
}