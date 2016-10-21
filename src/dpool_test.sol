pragma solidit ^0.4.0;

import 'dapple/test.sol'; // virtual "dapple" package imported when `dapple test` is run
import 'DPool.sol';

// Deriving from `Test` marks the contract as a test and gives you access to various test helpers.
contract dpool_test is Test {
    DPool dpool;
    Tester proxy_tester;
    // The function called "setUp" with no arguments is
    // called on a fresh instance of this contract before
    // each test. TODO: Document when to put setup logic in
    // setUp vs subclass constructor when writing Test subclasses
    function setUp() {
        dpool = new DPool();
        proxy_tester = new Tester();
        proxy_tester._target(dpool);
    }

    function testAddShare() {
        dpool.addShare(hex"01", hex"02");
        var (header, nonce) = dpool.getShare(0);
        assertEq32(header, hex"01");
        assertEq32(nonce, hex"02");
    }

    /*function testFailNonCreatorSet() {
        MyRegistry(proxy_tester).set("no", "stop");
    }
    event Set(bytes32 indexed key, bytes32 value);
    function testSetEvent() {
        expectEventsExact(reg);
        Set("hello", "hi");
        reg.set("hello", "hi");
    } */
}
