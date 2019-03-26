# MoacAPI

The MoacAPI makes it easier to communicate with MOAC API.

## Installation

MoacAPI is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'MoacAPI', :git => 'https://github.com/liweiz/MoacAPI.git'
```

Then run `pod install`

For more details of how to use CocoaPods, please take a look at [here](https://guides.cocoapods.org/using/using-cocoapods.html).

## Usage

### Get values from response

[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) is used as the way to get values you need from the response.

Make SwiftyJSON available
```swift
import SwiftyJSON
```

### Get a MoacAPIOperation instance
```swift
let op: MoacAPIOperation = MoacAPIOperation()
```

### Some variables used as inputs
```swift
// Account name to get token
    let account = "test"
    // Account password to get token
    let pwd: String = "123456"
    // Token for accessing API
    var token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50IjoidGVzdCIsInB3ZCI6IjEyMzQ1NiIsImlhdCI6MTU1MzIyMzg5NSwiZXhwIjoxNTUzMjMxMDk1fQ.C6gPF42Zn-OkoJeJ4Og0dV44OkkesVEbb9lXJdCpt6M"
    // Password used for account registration
    let registerPwd = "1111"
    // Account registered with API account registration
    // Most are received via 139.198.126.104:8080/api/account/v1.0/register
    // Account address
    let loginAddr = "0xA1763BFf29722A20CF15CAf61f5B21D74cD90EeF"
    // Account password
    let loginAddrPwd = "1111"
    // Account encode
    let loginAddrEncode = "o1+sCMmto2Ij5hWEnExyZ/mi72CClmrNUoGGKg2oNhmjbZiiW+5C82PZTSJfOwGkucoz7xyyaPoAx82zfHH4NCPZ1/b7Tz4DMOgOFYSXl/k="
    // Account keystore
    let loginAddrKeyStore = """
{"version":3,"id":"db018af3-2ffc-4e89-b502-b804659c0287","address":"a1763bff29722a20cf15caf61f5b21d74cd90eef","crypto":{"ciphertext":"2d7e7f88ff9ac44f736c54ddc8cb4d33801092bee897e5ffa53a25d61a6eff0d","cipherparams":{"iv":"8835f75616e61ec86b8d1929a70bfdb9"},"cipher":"aes-128-ctr","kdf":"scrypt","kdfparams":{"dklen":32,"salt":"831f1f881d26a1dc2f5395748c77c22c3def65a18655b6e2d096aed4ccfe9696","n":8192,"r":8,"p":1},"mac":"d51cb4b0394d07112f434d96798a60fcf5f8538123bb4feadd541be4f58c2fc1"}}
"""
    // Account private key
    let loginAddrPrivateKey = "0xc3547fe3a8eaa8b18fee0d7e01e92f633826af44c962b92f99eb70800e641646"
    // Public IP address for vnode and scsserver
    let myIP = "355.21.312.78"
    // Public IP port for vnode
    let myPort = "808"
    // Public IP port for scsserver monitor with "--rpcdebug" on
    let monitorPort = "809"
    // A testnet address on the vnode
    let testnetAddrOnMine = "0x63ad5cc2c80142a39911ed94a8676b8ab24c2fa9"
    // A testnet address on the vnode used to send all transactions
    let txSender = "0xf0e014cbf1185709fd0a0f8e5e8b13d6610efab9"
    // A valid testnet transaction hash
    let anyTxHash = "0x75da38c1bbfe92bc416cfd0e8e2a5a292f3c4db38a3a2bef189281056ff2a95e"
    // A deployed contract on testnet
    let simpleContractAddr = "0x08df09DD3163BC60C8F154540440220aCb0c035b"
    let simpleContractGetFuncName = "get()"
    let simpleContractSetFuncName = "set(uint)"
    let simpleContractSetParamType0 = "uint"
    let simpleContractSetParamValue0 = "7"
    // ERC20 contract address used to deploy microchain
    let erc20ContractAddr = "0x47a17b6611f600f9ca4497fa5c1126119b25005e"
    // Microchain address
    let microchainAddr = "0xc8af1419cc7940842608edd5585385030888c310"
    // Three scsids for three scsservers for microchain
    let scsAddr0 = "0xb5452a70baad8ab877503411cd9ffcf6d467205f"
    let scsAddr1 = "0x2cb0894288ba117fda59906adbbd06514cdfb883"
    let scsAddr2 = "0x41721724686c3b3668c29def8956ad389a1e10be"
    // Transaction hash of dappBase contract deployment
    let dappBaseTxHash = "0x2c9666f2751c3784ab1eeffb839970704620fd4957be436205843ec724ce3809"
    // DappBase contract address
    let dappBaseAddr = "0xb79cd88738420ee4dc6fb7a6facc82abcae05cb1"
    // DappBase contract getter method
    let dappGetter = "[\"getDappList\"]"
    // Dapp1 contract address
    let dapp1Addr = "0xdfd7f1c2defe4f4af3f964abb16b531079308fc4238894149ab3f62d838ab505"
    // Dapp1 contract setter function
    let dapp1SetterName = "addTup(uint,address)"
    let dapp1SetterParamType0 = "uint"
    let dapp1SetterParamType1 = "address"
    let dapp1SetterParamValue0 = "19"
    let dapp1SetterParamValue1 = "0x123123122123"
```

### /auth
```swift
op.auth(account: account, pwd: pwd).done { data in
    print(JSON(data))
}
```

### /api/account/v1.0/register
```swift
op.register(pwd: registerPwd, token: token).done { data in
    print(JSON(data))
}
```

### /api/account/v1.0/login
```swift
op.login(address: loginAddr, pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}
```

### /api/account/v1.0/import
```swift
op.importAccount(address: loginAddr, pwd: loginAddrPwd, keystore: loginAddrKeyStore, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getBalance
```swift
op.getBalance(vnodeip: myIP, vnodeport: myPort, address: loginAddr, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getBlockNumber
```swift
op.getBlockNumber(vnodeip: myIP, vnodeport: myPort, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getBlockInfo
```swift
op.getBlockInfo(vnodeip: myIP, vnodeport: myPort, block: "latest", token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getTransactionByHash
```swift
op.getTransactionByHash(vnodeip: myIP, vnodeport: myPort, hash: anyTxHash, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getTransactionReceiptByHash
```swift
op.getTransactionReceiptByHash(vnodeip: myIP, vnodeport: myPort, hash: anyTxHash, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/sendRawTransaction
```swift
// Password and ecode, but without privatekey
op.sendRawTransaction(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, amount: "0.03", method: "", paramtypes: [], paramvalues: [], privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, gasprice: "", token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.sendRawTransaction(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, amount: "0.03", method: "", paramtypes: [], paramvalues: [], privatekey: loginAddrPrivateKey, pwd: "", encode: "", gasprice: "", token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/callContract
```swift
op.callContract(vnodeip: myIP, vnodeport: myPort, contractaddress: simpleContractAddr, method: simpleContractGetFuncName, paramtypes: [], paramvalues: [], token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/transferErc
```swift
// Password and ecode, but without privatekey
op.transferErc(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, contractaddress: erc20ContractAddr, amount: "5000", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.transferErc(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, contractaddress: erc20ContractAddr, amount: "3000", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/getErcBalance
```swift
op.getErcBalance(vnodeip: myIP, vnodeport: myPort, address: loginAddr, contractaddress: erc20ContractAddr, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/ercApprove
```swift
// Password and ecode, but without privatekey
op.ercApprove(vnodeip: myIP, vnodeport: myPort, address: loginAddr, amount: "10000000", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, contractaddress: erc20ContractAddr, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.ercApprove(vnodeip: myIP, vnodeport: myPort, address: loginAddr, amount: "20", privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, contractaddress: erc20ContractAddr, token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/buyErcMintToken
```swift
// Password and ecode, but without privatekey
op.buyErcMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: ["uint256"], paramvalues: ["0.2"], token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.buyErcMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: ["uint256"], paramvalues: ["0.0001"], token: token).done { data in
    print(JSON(data))
}
```

### /api/vnode/v1.0/buyMoacMintToken
```swift
// Password and ecode, but without privatekey
op.buyMoacMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: "[\"uint256\"]", paramvalues: "[0.0001]", token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.buyMoacMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: "[\"uint256\"]", paramvalues: "[0.0002]", token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/getBlockNumber
```swift
op.getBlockNumberMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/getBlock
```swift
op.getBlockMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, blocknum: "1", token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/getTransactionByHash
```swift
op.getTransactionByHashMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, hash: dappBaseTxHash, token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/getTransactionReceiptByHash
```swift
op.getTransactionReceiptByHashMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, hash: dappBaseTxHash, token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/getBalance
```swift
op.getBalanceMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, address: scsAddr1, token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/transferCoin
```swift
// Password and ecode, but without privatekey
op.transferCoinMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, via: txSender, from: loginAddr, to: scsAddr1, amount: "0.009", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.transferCoinMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, via: txSender, from: microchainAddr, to: scsAddr1, amount: "6", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/sendRawTransaction
```swift
// Password and ecode, but without privatekey
op.sendRawTransactionMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, from: loginAddr, microchainaddress: microchainAddr, via: txSender, amount: "0", dappaddress: dapp1Addr, method: dapp1SetterName, paramtypes: [dapp1SetterParamType0, dapp1SetterParamType1], paramvalues: [dapp1SetterParamValue0, dapp1SetterParamValue1], privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.sendRawTransactionMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, from: loginAddr, microchainaddress: microchainAddr, via: txSender, amount: "0", dappaddress: dapp1Addr, method: dapp1SetterName, paramtypes: [dapp1SetterParamType0, dapp1SetterParamType1], paramvalues: [dapp1SetterParamValue0, dapp1SetterParamValue1], privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/callContract
```swift
op.callContractMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappaddress: dappBaseAddr, data: dappGetter, token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/redeemErcMintToken
```swift
// Password and ecode, but without privatekey
op.redeemErcMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: loginAddr, amount: "0.02", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.redeemErcMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.03", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
    print(JSON(data))
}
```

### /api/micro/v1.0/redeemMoacMintToken
```swift
// Password and ecode, but without privatekey
op.redeemMoacMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.2", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
    print(JSON(data))
}

// Privatekey, but without password and ecode
op.redeemMoacMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.03", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
    print(JSON(data))
}
```