pragma solidity ^0.8.0;

contract ContratoVotacao {
    mapping(address => bool) public membros;
    mapping(address => bool) public votosRecebidos;
    mapping(uint => uint) public contagemVotos;

    address[] public membrosArray;

    modifier apenasMembros() {
        require(membros[msg.sender], "Voce nao e um membro autorizado.");
        _;
    }

    function adicionarMembro(address _novoMembro) public {
        membros[_novoMembro] = true;
        membrosArray.push(_novoMembro);
    }

    function votar(uint _opcao) public apenasMembros {
        require(!votosRecebidos[msg.sender], "Voce ja votou.");
        require(_opcao == 0 || _opcao == 1, "Opcao invAlida. Escolha 0 ou 1.");


        contagemVotos[_opcao]++;

        votosRecebidos[msg.sender] = true;
    }
}