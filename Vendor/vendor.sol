// SPDX-License-Identifier: MIT
//specify the version of solidity
pragma solidity ^0.4.24;

contract Vendor {
    int[] public price_list = [25, 30, 20];
    int[] public vegetable_count = [0, 0, 0];
    int[] public good_vegetable_count = [0, 0, 0];
    int public net_price = 0;
    int public selling_price = 0;

    function setGood(int[] x) public {
        
        for (uint i = 0; i < price_list.length; i++) {
            vegetable_count[i] = vegetable_count[i] + x[i];
            good_vegetable_count[i] = good_vegetable_count[i] + x[i];
        }
    }

    function setBad(int[] y) public {
        
        for (uint i = 0; i < price_list.length; i++) {
            vegetable_count[i] = vegetable_count[i] + y[i];
        }
    }

    function netPrice() public {

        for (uint j = 0; j < price_list.length; j++) {
            net_price = net_price + vegetable_count[j] * price_list[j];
        }
    }

    function sellingPrice() public {

        for (uint i = 0; i < price_list.length; i++) {
            selling_price = selling_price + good_vegetable_count[i] * (price_list[i] + 20);
        }
    }

    function getProfitOrLoss() public view returns(string) {
        int profit = selling_price - net_price;
        if (profit < 0) {
            return "LOSS";
        }
        else if (profit > 0) {
            return "PROFIT";
        }
        else {
            return "NO PROFIT NO LOSS";
        }
    }
}
