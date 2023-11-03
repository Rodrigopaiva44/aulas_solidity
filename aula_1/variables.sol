pragma solidity ^0.8.0;

contract VariableExample {
    // Declaração de variáveis
    uint public number;
    string public name;
    bool public isActive;
    address public owner;
    uint[] public numbers;
    
    // Função de inicialização*
    constructor(uint _number, string memory _name) {
        number = _number;
        name = _name;
        isActive = true;
        owner = msg.sender;
        numbers.push(1);
        numbers.push(2);
        numbers.push(3);
    }
    
    // Função que altera o valor da variável 'number'
    function setNumber(uint _newNumber) public {
        number = _newNumber;
    }
    
    // Função que adiciona um novo valor ao array 'numbers'
    function addNumber(uint _newNumber) public {
        numbers.push(_newNumber);
    }
}