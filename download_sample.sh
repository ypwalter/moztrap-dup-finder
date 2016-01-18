if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <productversion id> <number of test cases>"
  echo "    <productversion id>     id of product version"
  #echo "    <number of test cases>  number of test cases you want to download, default = 20"
  exit 1
fi



MAXLIMIT=1000
CHUNKCOUNT=11
for (( i = 0; i < $CHUNKCOUNT; i++ )); do
  OFFSET=$(( i * MAXLIMIT ))
  OUTPUT_FILE="input/full_$1_$OFFSET.json"
  #echo "https://moztrap.mozilla.org/api/v1/caseversion/?format=json&productversion=$1&offset=$OFFSET&limit=$MAXLIMIT" -O $OUTPUT_FILE
  wget "https://moztrap.mozilla.org/api/v1/caseversion/?format=json&productversion=$1&offset=$OFFSET&limit=$MAXLIMIT" -O $OUTPUT_FILE
  echo "$OUTPUT_FILE downloaded"
done
