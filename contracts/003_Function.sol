// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FunctionTypes {
    // function <function name>([parameter types[, ...]]) {internal|external|public|private} [pure|view|payable] [virtual|override] [<modifiers>] [returns (<return types>)]{ <function body> }
    
    /*
        1. function: The fixed usage when declaring a function. To Write a function, it needs to start with the function keyword.
        2. <function name>: The name of the function.
        3. ([parameter types[, ...]]): The parameters of the function written in parentheses, that is, the variable types and names that are input to the function.
        4. {internal|external|public|private}: Function visibility speciffers, of which there are four types.
            - public: visable both internally and externally
            - private: accessible only from within this contract, inherited contracts cannot use it.
            - external: accessible only from outside the contract(but can be called internally with this.f(), where f is the function name).
            - internal: accessible only from withi the contract, inherited contracts can use it.
        
            Note 1: Functions defined in the contract need to have their visibity explicitly specified; they do not have a default value.
            Note 2: public|private|internal can also be used to modify state variables. Public variables automatically generate a getter function with the same name for 
                    querying values. State variables that do not specify a visibility type default to internal.
        5. [pure|view|payable]: keywords that determine the function's permissions/features.
            - payable: functions with it can receive ETH transfers during execution.
            - pure: the pure function cannot read or write to the state variables on the chain.
            - viwe: The view function can read but not write to state variables.
        6. [virtual|override]: Indicates whether the method can be overridden or whether it is an overridden method. Virtual is used in the parent contract to indicate that 
                               the method can be overridden by the child contract. override is used in the child contract to denote that the methods overrides a method in
                               the parents contract.
        7. <modifiers>: Custom modifiers, which can have zero or more modifiers.
        8. [returns ()]: The variable types and names returned by the function.
        <function body>: The body of the functions.
    
    */
    uint256 public number = 5;
    
    function add() external {
        number += 1;
    }
    

    function addPure(uint256 _number) external pure returns(uint256 new_number) {
        new_number = _number + 1;
    }

    function addView() external view returns (uint256 new_number) {
        new_number = number + 1;
    }

    function minus() internal {
        number = number - 1;
    }

    function minusCall() external {
        minus();
    }

    function minusPayable() external payable returns(uint256 balance) {
        minus();
        balance = address(this).balance;
    }
}