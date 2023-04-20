// SPDX-License-Identifier: MIT
// 声明solidity版本
pragma solidity ^0.8.4;

contract FunctionTypes {
    
    uint256 public number = 5;
 
    constructor() payable {}
 
    // 函数类型， function (<parameter types>) {internal|external} [pure|view|payable] [returns (<return types>)]
    // public， 内部和外部均可见。
    // private, 只能从本合约内部访问,继承的合约也不能用
    // external, 只能从合约外部访问，但是可以用this.f()来调用，f是函数名
    // internal, 只能从合约内容部访问，继承的合约可以用
    // pure|view|payable 决定函数功能和权限，payable可支付的，运行时可以给合约转入ETH, pure和view不改写链上状态，不消耗gas
 
 
    // default
    function add() external {
        number = number + 1;
    }
 
    // pure
    function addPure(uint256 _number) external pure returns(uint256 new_number){
        new_number = _number + 1;
    }
 
    // view 
    function addView() external view returns(uint256 new_number){
        new_number = number + 1;
    }
 
    // internal
    function minus() internal {
        number = number - 1;
    }
 
    function minusCall() external{
        minus();
    }
 
    function minusPayable() external payable returns(uint256 balance){
        minus();
        balance = address(this).balance;
    }
}