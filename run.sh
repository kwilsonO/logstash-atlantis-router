LOGSTASHVER="logstash-1.5.3"
LOGSTASHPATH="/root/atlantis-analytics"
REPONAME="logstash-atlantis-router"
REPOPATH="${LOGSTASHPATH}/${REPONAME}"
SCRIPTSDIR="${REPOPATH}/scripts"
RUNSCRIPTS="${SCRIPTSDIR}/run"

for f in $RUNSCRIPTS/*.sh; do

	sh $f

done
