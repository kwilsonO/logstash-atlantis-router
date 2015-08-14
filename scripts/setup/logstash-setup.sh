LOGSTASHVER="logstash-1.5.3"
LOGSTASHDL="https://download.elastic.co/logstash/logstash/${LOGSTASHVER}.tar.gz"
LOGSTASHPATH="/root/atlantis-analytics"
REPONAME="logstash-atlantis-router"
REPOPATH="${LOGSTASHPATH}/${REPONAME}"
LOGPATH="/var/log/atlantis/logstash"

wget "${LOGSTASHDL}"
tar -xzf "${LOGSTASHVER}.tar.gz"
rm "${LOGSTASHVER}.tar.gz"

if [ ! -d "$LOGPATH" ]; then 
		
	mkdir "${LOGPATH}"
fi
