for LINE in `cat ipList.csv`;do

	NAME=$(echo ${LINE} | cut -d , -f 1)

	DATARAW=$(echo  '{"RemoveWorker":{"name":"'"${NAME}"'"}}')
	echo $DATARAW
        curl 'http://127.0.0.1:3000/api/p/http%3A%2F%2F127.0.0.1%3A3001/wm/config' \
  -H 'Content-Type: application/json' \
  --data-raw ${DATARAW}

    echo
done
