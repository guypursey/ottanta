
MYDIR="$(dirname "$(readlink -f "$0")")"

test1=$(<$MYDIR/test_samples/test01.md)
return1="$($MYDIR/../ottanta.sh $MYDIR/test_samples/test01.md)"
expected1="$(<$MYDIR/test_samples/expected01.md)"

if [[ $return1 == $expected1 ]]; then
	echo "Success!"
else
	echo -e "Failed.\n"
	echo -e "Expected:\n"
	echo -e "$expected1 \n"
	echo -e "Got: \n"
	echo -e "$return1 \n"
fi

echo "Tests complete."
