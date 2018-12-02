/*
第一個智能合約
只有兩個功能：
1. 把一個東西存到區塊鏈上
2. 取得區塊鏈上的東西
*/

//編譯器版本 使用的程式語言 語言版本
//＾代表相容所有之前得版本都可以編譯成功（沒加的話代表只有該版本可以相容）
pragma solidity ^0.4.25;

// 定義一個智能合約，習慣上第一個字大小，功能的話則是都小寫
contract Storage{
    // 資料到底被儲存在哪裡？被紀錄在區塊鏈上
    // 其實以太坊是有容量的概念(帳本是有實體空間的)
    // 如果一直新增變數塞爆帳本？？？或是新增一個超大的資料在上面？
    // 一樣可以放，但你要付超高的手續費，也就是花錢（手續費）買儲存空間的概念
    // variable init value會是0
    uint data;
    
    // public:智能合約放上區塊鏈後，所有人都可以執行這個function
    // 其他也有private 
    function set(uint x) public { 
        data = x;
    }
    
    // constant:這個方法只會讀取，不會寫入，這個動作不會花費任何gas
    // constant public 順序沒差，但return一定要最後
    // 宣告時的return一定要加s，並且要括號註明回傳的型態
    // 但函數裡面的return不能加s
    function get() public constant returns(uint) {
        return data;
    }
}