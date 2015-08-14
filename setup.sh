LOGSTASHVER="logstash-1.5.3"
LOGSTASHPATH="/root/atlantis-analytics"
REPONAME="logstash-atlantis-router"
REPOPATH="${LOGSTASHPATH}/${REPONAME}"
SCRIPTSDIR="${REPOPATH}/scripts"
SETUPSCRIPTS="${SCRIPTSDIR}/setup"

for f in $SETUPSCRIPTS/*.sh; do

	sh $f

done
