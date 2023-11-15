// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {EthereumScript} from 'aave-helpers/ScriptUtils.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';

/**
 * @dev Create Long Proposal
 * command: make deploy-ledger contract=src/20231114_AaveV3Ethereum_AaveGovernanceV3Activation/AaveGovernanceV3Activation_20231114.s.sol:CreateLongProposal chain=mainnet
 */
contract CreateLongProposal is EthereumScript {
  function run() external {
    // create payloads
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildMainnet(address(0));

    // create proposal
    vm.startBroadcast();
    GovHelpers.createProposal(
      payloads,
      GovHelpers.ipfsHashFile(
        vm,
        'src/20231114_AaveV3Ethereum_AaveGovernanceV3Activation/AaveGovernanceV3Activation.md'
      ),
      AaveGovernanceV2.LONG_EXECUTOR
    );
  }
}

/**
 * @dev Create Proposal
 * command: make deploy-ledger contract=src/20231114_AaveV3Ethereum_AaveGovernanceV3Activation/AaveGovernanceV3Activation_20231114.s.sol:CreateProposal chain=mainnet
 */
contract CreateProposal is EthereumScript {
  function run() external {
    // create payloads
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](2);
    payloads[0] = GovHelpers.buildMainnet(address(0));
    payloads[1] = GovHelpers.buildBase(address(1));

    // create proposal
    vm.startBroadcast();
    GovHelpers.createProposal(
      payloads,
      GovHelpers.ipfsHashFile(
        vm,
        'src/20231114_AaveV3Ethereum_AaveGovernanceV3Activation/AaveGovernanceV3Activation.md'
      )
    );
  }
}
