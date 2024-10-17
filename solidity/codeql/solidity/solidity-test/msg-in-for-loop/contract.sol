contract MsgValueInLoop{

    mapping (address => uint256) balances;

    // un contrato que recibe un address, y le actualiza su balance con el valor del msg.value
    function bad(address receivers) public payable {
        balances[receivers] += 3; // ArrayAcces -> literalExpression
        balances[receivers] += msg.value; //ArrayAccess -> MemberExppression
        
    }

    function bad(address[] memory receivers) public payable {
        for (uint256 i=0; i < receivers.length; i++) {
            balances[receivers[i]] += msg.value; //ArrayAccess -> MemberExppression
        }
    }
}