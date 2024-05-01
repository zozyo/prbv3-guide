for LINE in `cat ipList.csv`;do

	NAME=$(echo ${LINE} | cut -d , -f 1)
	URL=$(echo ${LINE} | cut -d , -f 2)
	STAKE=$(echo ${LINE} | cut -d , -f 3)
	PID=$(echo ${LINE} | cut -d , -f 4)

	DATARAW=$(echo '{"AddWorker":{"name":"'"${NAME}"'","endpoint":"'"${URL}"'","stake":"'"${STAKE}"'","pid":'${PID}',"sync_only":false,"disabled":false,"gatekeeper":false}}')
	echo $DATARAW
        curl 'http://127.0.0.1:3001/wm/config' \
  -H 'Content-Type: application/json' \
  --data-raw ${DATARAW}

    echo
done

