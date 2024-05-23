sourceEnv=$1
targetEnv=$2
if [ ! -f $1 ];
then
    echo "WARNING: Source Config file can't be found!"
    exit 1
fi
echo "# Auto generated file, don't modify. Please refer to [.env.prod, .env.dev]" > $targetEnv
echo "" >> $targetEnv
cat $sourceEnv >> $targetEnv


# sh change-env.sh .env.development .env
# sh change-env.sh .env.production .env