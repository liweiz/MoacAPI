//
//  Tests.swift
//  Tests
//
//  Created by Liwei Zhang on 2019-02-27.
//  Copyright © 2019 Liwei Zhang. All rights reserved.
//

import XCTest
import PromiseKit
import Moya
import Alamofire
import SwiftyJSON

@testable import MoacAPI

class Tests: XCTestCase {
    let op: MoacAPIOperation = MoacAPIOperation()
    
    let account = "test"
    let pwd: String = "123456"
    
    var token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50IjoidGVzdCIsInB3ZCI6IjEyMzQ1NiIsImlhdCI6MTU1MzIyMzg5NSwiZXhwIjoxNTUzMjMxMDk1fQ.C6gPF42Zn-OkoJeJ4Og0dV44OkkesVEbb9lXJdCpt6M"

    let registerPwd = "1111"
    
    let loginAddr = "0xA1763BFf29722A20CF15CAf61f5B21D74cD90EeF"
    let loginAddrPwd = "1111"
    let loginAddrEncode = "o1+sCMmto2Ij5hWEnExyZ/mi72CClmrNUoGGKg2oNhmjbZiiW+5C82PZTSJfOwGkucoz7xyyaPoAx82zfHH4NCPZ1/b7Tz4DMOgOFYSXl/k="
    let loginAddrKeyStore = """
{"version":3,"id":"db018af3-2ffc-4e89-b502-b804659c0287","address":"a1763bff29722a20cf15caf61f5b21d74cd90eef","crypto":{"ciphertext":"2d7e7f88ff9ac44f736c54ddc8cb4d33801092bee897e5ffa53a25d61a6eff0d","cipherparams":{"iv":"8835f75616e61ec86b8d1929a70bfdb9"},"cipher":"aes-128-ctr","kdf":"scrypt","kdfparams":{"dklen":32,"salt":"831f1f881d26a1dc2f5395748c77c22c3def65a18655b6e2d096aed4ccfe9696","n":8192,"r":8,"p":1},"mac":"d51cb4b0394d07112f434d96798a60fcf5f8538123bb4feadd541be4f58c2fc1"}}
"""
    let loginAddrPrivateKey = "0xc3547fe3a8eaa8b18fee0d7e01e92f633826af44c962b92f99eb70800e641646"
    
    let myIP = "135.23.110.72"
    let myPort = "808"
    let monitorPort = "809"
    
    let testnetAddrOnMine = "0x63ad5cc2c80142a39911ed94a8676b8ab24c2fa9"
    let txSender = "0xf0e014cbf1185709fd0a0f8e5e8b13d6610efab9"
    
    let anyTxHash = "0x75da38c1bbfe92bc416cfd0e8e2a5a292f3c4db38a3a2bef189281056ff2a95e"
    
    let simpleContractAddr = "0x08df09DD3163BC60C8F154540440220aCb0c035b"
    let simpleContractGetFuncName = "get()"
    let simpleContractSetFuncName = "set(uint)"
    let simpleContractSetParamType0 = "uint"
    let simpleContractSetParamValue0 = "7"
    
    let erc20ContractAddr = "0x47a17b6611f600f9ca4497fa5c1126119b25005e"
    
    let microchainAddr = "0xc8af1419cc7940842608edd5585385030888c310"
    
    let scsAddr0 = "0xb5452a70baad8ab877503411cd9ffcf6d467205f"
    let scsAddr1 = "0x2cb0894288ba117fda59906adbbd06514cdfb883"
    let scsAddr2 = "0x41721724686c3b3668c29def8956ad389a1e10be"
    
    let dappBaseTxHash = "0x2c9666f2751c3784ab1eeffb839970704620fd4957be436205843ec724ce3809"
    let dappTxHash1 = "0xe66f30d4a2c659d2b332d65e37644c12592a5f87fa09ac4fb65bb9ff3eb62cee"
    let dappTxHash2 = "0x72a379dd4653b1340791f0791a5358e67aa9468a1f8d56c73a4d0544c46c60e4"
    
    let dappBaseAddr = "0xb79cd88738420ee4dc6fb7a6facc82abcae05cb1"
    
    let dapp1Addr = "0xdfd7f1c2defe4f4af3f964abb16b531079308fc4238894149ab3f62d838ab505"
    let dapp1SetterName = "addTup(uint,address)"
    let dapp1SetterParamType0 = "uint"
    let dapp1SetterParamType1 = "address"
    let dapp1SetterParamValue0 = "19"
    let dapp1SetterParamValue1 = "0x123123122123"
    
    let dapp0SetFuncName = "set(uint)"
    let dapp0SetParamType0 = "uint"
    let dapp0SetParamValue0 = "7"
    let dapp0GetFuncName = "get(uint)"
    let dapp0GetParamType0 = "uint"
    let dapp0GetParamValue0 = "7"
    let dappAddr1 = "0xb79cd88738420ee4dc6fb7a6facc82abcae05cb1"
    let dappGetter = "[\"getDappList\"]"
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuth() {
        let e = XCTestExpectation(description: "register")
        op.auth(account: account, pwd: pwd).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testRegister() {
        let e = XCTestExpectation(description: "register")
        op.register(pwd: registerPwd, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testLogin() {
        let e = XCTestExpectation(description: "login")
        op.login(address: loginAddr, pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testImportAccount() {
        let e = XCTestExpectation(description: "login")
        op.importAccount(address: loginAddr, pwd: loginAddrPwd, keystore: loginAddrKeyStore, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetBalance() {
        let e = XCTestExpectation(description: "getBalance")
        op.getBalance(vnodeip: myIP, vnodeport: myPort, address: loginAddr, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetBlockNumber() {
        let e = XCTestExpectation(description: "getBlockNumber")
        op.getBlockNumber(vnodeip: myIP, vnodeport: myPort, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetBlockInfo() {
        let e = XCTestExpectation(description: "getBlockInfo")
        op.getBlockInfo(vnodeip: myIP, vnodeport: myPort, block: "latest", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetTransactionByHash() {
        let e = XCTestExpectation(description: "getTransactionByHash")
        op.getTransactionByHash(vnodeip: myIP, vnodeport: myPort, hash: anyTxHash, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetTransactionReceiptByHash() {
        let e = XCTestExpectation(description: "getTransactionReceiptByHash")
        op.getTransactionReceiptByHash(vnodeip: myIP, vnodeport: myPort, hash: anyTxHash, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testSendRawTransactionPwd() {
        let e = XCTestExpectation(description: "sendRawTransaction")
        op.sendRawTransaction(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, amount: "0.03", method: "", paramtypes: [], paramvalues: [], privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, gasprice: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }
    
    func testSendRawTransactionNoPwd() {
        let e = XCTestExpectation(description: "sendRawTransaction")
        op.sendRawTransaction(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, amount: "0.03", method: "", paramtypes: [], paramvalues: [], privatekey: loginAddrPrivateKey, pwd: "", encode: "", gasprice: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 200.0)
    }
    
    func testCallContractGet() {
        let e = XCTestExpectation(description: "callContract")
        op.callContract(vnodeip: myIP, vnodeport: myPort, contractaddress: simpleContractAddr, method: simpleContractGetFuncName, paramtypes: [], paramvalues: [], token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }
    
//    func testCallContractSet() {
//        let e = XCTestExpectation(description: "callContract")
//        op.callContract(vnodeip: myIP, vnodeport: myPort, contractaddress: simpleContractAddr, method: simpleContractSetFuncName, paramtypes: [simpleContractSetParamType0], paramvalues: [simpleContractSetParamValue0], token: token).done { data in
//            print(JSON(data))
//            e.fulfill()
//        }
//        wait(for: [e], timeout: 10.0)
//    }
    
    func testTransferErcPwd() {
        let e = XCTestExpectation(description: "transferErc")
        op.transferErc(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, contractaddress: erc20ContractAddr, amount: "5000", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }
    
    func testTransferErcNoPwd() {
        let e = XCTestExpectation(description: "transferErc")
        op.transferErc(vnodeip: myIP, vnodeport: myPort, from: loginAddr, to: testnetAddrOnMine, contractaddress: erc20ContractAddr, amount: "3000", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }

    func testGetErcBalance() {
        let e = XCTestExpectation(description: "getErcBalance")
        op.getErcBalance(vnodeip: myIP, vnodeport: myPort, address: loginAddr, contractaddress: erc20ContractAddr, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 30.0)
    }

    func testErcApprovePwd() {
        let e = XCTestExpectation(description: "ercApprove")
        op.ercApprove(vnodeip: myIP, vnodeport: myPort, address: loginAddr, amount: "10000000", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, contractaddress: erc20ContractAddr, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }
    
    func testErcApproveNoPwd() {
        let e = XCTestExpectation(description: "ercApprove")
        op.ercApprove(vnodeip: myIP, vnodeport: myPort, address: loginAddr, amount: "20", privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, contractaddress: erc20ContractAddr, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }

    func testBuyErcMintTokenPwd() {
        let e = XCTestExpectation(description: "buyErcMintToken")
        op.buyErcMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: ["uint256"], paramvalues: ["0.2"], token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }
    
    func testBuyErcMintTokenNoPwd() {
        let e = XCTestExpectation(description: "buyErcMintToken")
        op.buyErcMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: ["uint256"], paramvalues: ["0.0001"], token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }

    func testBuyMoacMintTokenPwd() {
        let e = XCTestExpectation(description: "buyMoacMintToken")
        op.buyMoacMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: "[\"uint256\"]", paramvalues: "[0.0001]", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }
    
    func testBuyMoacMintTokenNoPwd() {
        let e = XCTestExpectation(description: "buyMoacMintToken")
        op.buyMoacMintToken(vnodeip: myIP, vnodeport: myPort, address: loginAddr, privatekey: loginAddrPrivateKey, pwd: "", encode: "", microchainaddress: microchainAddr, method: "buyMintToken(uint256)", paramtypes: "[\"uint256\"]", paramvalues: "[0.0002]", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 100.0)
    }

    func testGetBlockNumberMicro() {
        let e = XCTestExpectation(description: "getBlockNumberMicro")
        op.getBlockNumberMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }

    func testGetBlockMicro() {
        let e = XCTestExpectation(description: "getBlockMicro")
        op.getBlockMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, blocknum: "1", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }

    func testGetBalanceMicro() {
        let e = XCTestExpectation(description: "getBalanceMicro")
        op.getBalanceMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, address: scsAddr1, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetTransactionByHashMicro() {
        let e = XCTestExpectation(description: "getTransactionByHashMicro")
        op.getTransactionByHashMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, hash: dappBaseTxHash, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testGetTransactionReceiptByHashMicro() {
        let e = XCTestExpectation(description: "getTransactionReceiptByHashMicro")
        op.getTransactionReceiptByHashMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, hash: dappBaseTxHash, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }

    func testTransferCoinMicroPwd() {
        let e = XCTestExpectation(description: "login")
        op.transferCoinMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, via: txSender, from: loginAddr, to: scsAddr1, amount: "0.009", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testTransferCoinMicroNoPwd() {
        let e = XCTestExpectation(description: "login")
        op.transferCoinMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, via: txSender, from: microchainAddr, to: scsAddr1, amount: "6", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }

    func testSendRawTransactionMicroPwd() {
        let e = XCTestExpectation(description: "login")
        op.sendRawTransactionMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, from: loginAddr, microchainaddress: microchainAddr, via: txSender, amount: "0", dappaddress: dapp1Addr, method: dapp1SetterName, paramtypes: [dapp1SetterParamType0, dapp1SetterParamType1], paramvalues: [dapp1SetterParamValue0, dapp1SetterParamValue1], privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testSendRawTransactionMicroNoPwd() {
        let e = XCTestExpectation(description: "login")
        op.sendRawTransactionMicro(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, from: loginAddr, microchainaddress: microchainAddr, via: txSender, amount: "0", dappaddress: dapp1Addr, method: dapp1SetterName, paramtypes: [dapp1SetterParamType0, dapp1SetterParamType1], paramvalues: [dapp1SetterParamValue0, dapp1SetterParamValue1], privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 30.0)
    }

    func testCallContractMicro() {
        let e = XCTestExpectation(description: "callContract")
        op.callContractMicro(microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappaddress: dappBaseAddr, data: dappGetter, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }

    func testRedeemErcMintTokenPwd() {
        let e = XCTestExpectation(description: "redeemErcMintToken")
        op.redeemErcMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: loginAddr, amount: "0.02", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }
    
    func testRedeemErcMintTokenNoPwd() {
        let e = XCTestExpectation(description: "redeemErcMintToken")
        op.redeemErcMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.03", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testRedeemMoacMintTokenPwd() {
        let e = XCTestExpectation(description: "login")
        op.redeemMoacMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.2", privatekey: "", pwd: loginAddrPwd, encode: loginAddrEncode, token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 10.0)
    }
    
    func testRedeemMoacMintTokenNoPwd() {
        let e = XCTestExpectation(description: "login")
        op.redeemMoacMintToken(vnodeip: myIP, vnodeport: myPort, microip: myIP, microport: monitorPort, microchainaddress: microchainAddr, dappbaseaddress: dappBaseAddr, via: txSender, address: scsAddr0, amount: "0.03", privatekey: loginAddrPrivateKey, pwd: "", encode: "", token: token).done { data in
//            print(JSON(data))
            let ok = JSON(data)["success"].boolValue
            XCTAssertTrue(ok)
            e.fulfill()
        }
        wait(for: [e], timeout: 50.0)
    }
}
