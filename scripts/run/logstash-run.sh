LOGSTASHVER="logstash-1.5.3"
REPONAME="logstash-atlantis-router"
REPOPATH="/root/atlantis-analytics"
LOGSTASHPATH="${REPOPATH}/${REPONAME}"
LOGSTASHDIR="${LOGSTASHPATH}/${LOGSTASHVER}"
CONFIGDIR="${LOGSTASHPATH}/config-files"
LOGPATH="/var/log/atlantis/logstash"


#Instance Data gathering

URL="http://169.254.169.254/latest/meta-data"
INSTFULLHOST=$(curl ${URL}/hostname)
INSTID=$(curl ${URL}/instance-id)
INSTTYPE=$(curl ${URL}/instance-type)
INSTLOCALHST=$(curl ${URL}/local-hostname)
INSTLOCALIPV4=$(curl ${URL}/local-ipv4)
INSTMACADDR=$(curl ${URL}/mac)
INSTPUBHOST=$(curl ${URL}/public-hostname)
INSTPUBIP=$(curl ${URL}/public-ipv4)
INSTSECG=$(curl ${URL}/security-groups)

cp $CONFIGDIR/templates/$REPONAME.template.conf $CONFIGDIR/$REPONAME.conf

sed -i "s/%{INSTFULLHOST}/${INSTFULLHOST}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTID}/${INSTID}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTTYPE}/${INSTTYPE}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTLOCALHST}/${INSTLOCALHST}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTLOCALIPV4}/${INSTLOCALIPV4}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTMACADDR}/${INSTMACADDR}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTPUBHOST}/${INSTPUBHOST}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTPUBIP}/${INSTPUBIP}/g" $CONFIGDIR/$REPONAME.conf
sed -i "s/%{INSTSECG}/${INSTSECG}/g" $CONFIGDIR/$REPONAME.conf

#Other Logstash
export SINCEDB_DIR="$REPOPATH"

if [ -e "${LOGPATH}/out.log" ]; then
	rm "${LOGPATH}/out.log"
fi
if [ -e "${LOGPATH}/err.log" ]; then
	rm "${LOGPATH}/err.log"
fi

$LOGSTASHDIR/bin/logstash -e $CONFIGSTR -f "${CONFIGDIR}/${REPONAME}.conf" > $LOGPATH/out.log 2> $LOGPATH/err.log &
