#echo "Stopping manager container......"
docker-compose -f /home/pi/Code/monerobox/settings/manager.yml down
#echo "Stopping web container......"
docker-compose -f /home/pi/Code/monerobox/settings/web.yml down

cd /home/pi/Code/monerobox
./start_manager.sh
