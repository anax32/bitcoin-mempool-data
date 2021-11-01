# Mempool transaction dump

Gzip compressed list of mempool transaction json documents, one per-line.

Each line is a single JSON document describing a bitcoin mempool transaction.
Transactions are recorded from the ZMQ `rawtx` channel from a fullnode
and decoded with the `decoderawtransaction` RPC call.

see: https://bitcoincore.org/en/doc/0.21.0/rpc/rawtransactions/decoderawtransaction/

## files

+ [mempool.log.gz](https://btc-logger-mempool20210719104029460200000001.s3.eu-west-2.amazonaws.com/eu-west-2c/consolidated/mempool-old.log.gz)
    + uncompressed size: 69883147223 bytes
    + number of documents: 24291128
+ [mempool-20211017122241-20211030230346.log.gz](https://btc-logger-mempool20210719104029460200000001.s3.eu-west-2.amazonaws.com/eu-west-2c/consolidated/mempool-20211018042725-20211017112242.log.gz)
    + uncompressed size: 340593794781 bytes
    + number of documents: 122500000

## notes on the data

an `extra` key is present in each transaction which holds the timezone
and local time of the fullnode at the time the transaction was captured.
(NB: this data is not in the first `mempool.log.gz` file)

## example JQ queries

extract the first 2000 transactions with:

```bash
zcat mempool.log.gz | head -n 2000 > mempool-2k.log
```
