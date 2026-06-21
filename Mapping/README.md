# 🚀 Mappings & Structs in Solidity
This section explores two of the most fundamental and powerful data structures in Solidity:

✅ Mapping  
✅ Struct  
✅ Struct + Mapping Combination  

These constructs allow developers to model real-world data efficiently and build scalable smart contracts such as:
- Banking systems  
- User profiles  
- Token balances  
- Voting systems  
- DeFi protocols

## 🧠 Mapping
Mapping in Solidity acts like a hash table or dictionary in any other language. 
These are used to store the data in the form of key-value pairs, a key can be any of the built-in data types 
but reference types are not allowed while the value can be of any type. Mappings are mostly used to associate 
the unique Ethereum address with the associated value type. Mapping are datatypes in solidity.
They don’t have a “length”.
Iterable mapping can be implemented through lib.
They are accessed like arrays but they have one major advantage, all the key/value pairs are initialized with their default value.

🔹 Syntax:
- mapping(key => value) (access specifier) (name);

🔹 Example:
- mapping(address => uint) balances;
- balances[msg.sender] = 100;
- 👉 Meaning: Store 100 for this user address

## 🧠 Strructure
it is better to define structs than objects to reduce gas consumption.
Structs in Solidity allows you to create more complicated data types that have multiple properties. You can define your own type by creating a struct.
They are useful for grouping together related data. Members of the struct cannot be of the type struct.
Structs can be declared outside of a contract and imported in another contract. Generally, it is used to represent a record. 
To define a structure struct keyword is used, which creates a new data type. 

🔹 Syntax:

struct (structure_name) {  
   (data type) variable_1;  
   (data type) variable_2; 
}

For accessing any element of the structure, 'dot operator' is used, which separates the struct variable and the element we wish to access.
To define the variable of structure data type structure name is used.

## 🧠 Struct + Mapping 
🔹 Example:

struct User {
    string name;
    uint age;
    uint balance;
}

mapping(address => User) public users;

Each address → stores a full User structure

## 🔄 Data Flow (Struct + Mapping)
- User interacts with contract
- Data stored in mapping
- Mapping stores struct
- Blockchain permanently stores data
- Functions read/update data

Mappings store data efficiently, structs organize complex data, and together they enable scalable and real-world smart contract systems.
