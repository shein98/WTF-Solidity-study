// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Yeye {
    event Log(string msg);

    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual {
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}

contract Baba is Yeye {
    // Inherit two function: hip() and pop(), changed the output to Baba.
    function hip() public virtual override {
        emit Log("Baba");
    }

    function pop() public virtual override {
        emit Log("Baba");
    }

    function baba() public virtual {
        emit Log("Baba");
    }

    function callParent() public {
        Yeye.pop();
    }

    function callParentSuper() public {
        super.pop();
    }
}


contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}

contract Erzi is Yeye, Baba {
    // Inherit two function: hip() and pop(), output is Erzi.
    function hip() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }
}

// Inheritance of decorators
contract Base1 {
    modifier exactDividedBy2And3(uint256 _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}

contract Identifier is Base1 {
    modifier exactDividedBy2And3(uint256 _a) override {
        _;
        require(_a % 2 == 0 && _a % 3 == 0);
    }

    function getExactDividedBy2And3(uint256 _dividend)
        public
        pure
        exactDividedBy2And3(_dividend)
        returns (uint256, uint256)
    {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    function getExactDividedBy2And3WithoutModifier(uint256 _dividend)
        public
        pure
        returns (uint256, uint256)
    {
        uint256 div2 = _dividend / 2;
        uint256 div3 = _dividend / 3;
        return (div2, div3);
    }
}

// Inheritance of contructor.
abstract contract A {
    uint256 public a;

    constructor(uint256 _a) {
        a = _a;
    }
}

contract C is A {
    constructor(uint256 _c) A(_c * _c) {}
}
