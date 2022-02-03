pragma solidity >=0.4.21 <0.8.0;
contract Oracle {
    function getInt(bytes32) public view returns (int256, uint256);
    }
contract SimpleOracleStorage {
    int256 storedValue;
    uint256 storedDate;
    event valueChanged(int256 newValue, uint256 newDate);
    function getOracleData() public {
        bytes32 oracleId = 0xa746860893d253ea1ac6b7696a581cb8b242638f4f22f1d530c6c9c9aaff6245;
        address oracleAddress = 0x8ecEDdd1377E52d23A46E2bd3dF0aFE35B526D5F;
        Oracle oracleContract = Oracle(oracleAddress);
        (int256 value, uint256 date) = oracleContract.getInt(oracleId);
        storedValue = value;
        storedDate = date;
        emit valueChanged(value, date);
        }
        function get() public view returns (int256, uint256) {
            return (storedValue, storedDate);
            }
            }
