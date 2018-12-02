pragma solidity ^0.4.24;
// 定義MaoHsunToken
// 把這兩個把這兩個檔案複製到本機端的import用法
// import "../token/ERC20/ERC20.sol";
// import "../token/ERC20/ERC20Detailed.sol";

// 或是從網路import
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

/**
 * @title SimpleToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `ERC20` functions.
 */
contract MaoHsunToken is ERC20, ERC20Detailed {
    uint256 public constant INITIAL_SUPPLY = 4200000000 * (10 ** uint256(decimals()));

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    // 定義虛擬貨幣精準度到小數18位，發布10000 * 10^18個單位貨幣
    // 避免小數計算誤差，用整數來整數來處理
    // (TokenName, SimpleName, AccuracyBit) = (貨幣名稱, 貨幣簡稱, 精確度)
    // 名字可以跟其他人重複，因為貨幣的地址不一樣
    // 不過實際上要上交易所，相同名稱交易所不會讓你過
    constructor () public ERC20Detailed("MaoHsunCoin", "MHC", 18) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}