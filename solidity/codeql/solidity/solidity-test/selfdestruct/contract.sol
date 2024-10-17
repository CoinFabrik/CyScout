contract C{
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyOwner2() {
        assert(msg.sender == owner);
        _;
    }

    modifier onlyOwner3() {
        if(msg.sender == owner){
            _;
        }
    }

    function legit_selfdestruct() public onlyOwner {
        selfdestruct(payable(owner));
    }

    function legit_selfdestruct2() public onlyOwner2 {
        selfdestruct(payable(owner));
    }

    function legit_selfdestruct3() public onlyOwner3 {
        selfdestruct(payable(owner));
    }

    function i_am_a_backdoor() public {
        selfdestruct(payable(msg.sender));
    }

    function i_am_a_backdoor2(address payable to) public{
        internal_selfdestruct(to);
    }

    function internal_selfdestruct(address payable to) internal {
        selfdestruct(to);
    }

}