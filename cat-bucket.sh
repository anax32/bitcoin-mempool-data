#!/bin/bash


# get the bucket contents
aws s3 ls ${SRC_BUCKET} > bucket.lst

# sort by date
cat bucket.lst | sort -n | tr -s ' ' | cut -d' ' -f4 > names.lst

# process
rm mempool.log.gz
touch mempool.log.gz

for f in $( cat names.lst )
do
  echo $f
  aws s3 cp ${SRC_BUCKET}$f .
  cat $f >> mempool.log.gz
  rm $f
done

START=$(cat bucket.lst | head -n 1 | tr -s ' ' | cut -d' ' -f1,2 | tr -d ' :-')
END=$(cat bucket.lst | tail -n 1 | tr -s ' ' | cut -d' ' -f1,2 | tr -d ' :-')

mv mempool.log.gz mempool-$START-$END.log.gz

aws s3 cp mempool-$START-$END.log.gz $DST_BUCKET
