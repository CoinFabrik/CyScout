contract A{  
    function a(address from, address to, uint256 amount) public {
        erc20.transferFrom(from, to, amount);
    }
}