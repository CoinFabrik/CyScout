contract A{  
    function a(address from, address to, uint256 amount) public {
        erc20.transferFrom(msg.sender, to, amount);
    }
}