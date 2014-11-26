#!/bin/sh

op=$1
echo "new.irr.ru Test init"
case $op in

	"--update")

		## UPDATE HELPER`s
		echo -e "\033[33m Updating helper2 [irr.ru]...\033[0m"
		/usr/bin/ssh mephius@192.168.1.7 -p22 "cd /home/mephius/irr.ru; /usr/local/bin/git pull"
		# WEB 17
		echo -e "\033[33m Updating helper2-web17 [irr.ru]...\033[0m"
		/usr/bin/ssh mephius@192.168.1.179 -p22 "cd /home/mephius/irr.ru; /usr/local/bin/git pull"
		echo -e "\033[33m Updating helper2kz-web17kz [irr.ru]...\033[0m"
		/usr/bin/ssh mephius@192.168.1.179 -p22 "cd /home/mephius/irr.kz; /usr/local/bin/git pull"

		echo -e "\033[33m Updating helper2 [irr.kz]...\033[0m"
		/usr/bin/ssh mephius@192.168.1.7 -p22 "cd /home/mephius/irr.kz; /usr/local/bin/git pull"

		echo -e "\033[33m Updating cruncher...\033[0m"
		/usr/bin/ssh mephius@192.168.1.11 -p22 "cd /home/mephius/irr.ru; /usr/local/bin/git pull"

		echo -e "\033[33m Updating helper4...\033[0m"
		/usr/bin/ssh mephius@192.168.1.77 -p22 "cd /home/mephius/irr.ru; /usr/bin/git pull"

		echo -e "\033[33m Updating helper3...\033[0m"
		cd /home/mephius/irr.ru
		sudo -u mephius /usr/local/bin/git pull

		random=`od -vAn -N4 -tu4 < /dev/urandom | awk '{print $1}'`
		/home/mephius/configs/rc.conf.new.php/minify/js_css_builder.php -n $random.js --js
		builder_status=$?
		need_copy_js_files=0
		echo " Status: $builder_status"
		if [ $builder_status = 0 ]; then
			## MINIFY ERROR ##
			echo -e " \033[1m\033[31m\033[5m ERROR on JS building\033[0m"
			exit 0
		elif [ $builder_status = 1 ]; then
			## MINIFY IS NOT NEED
			echo -e " \033[1m\033[34m\033m JS minify is not needed \033[0m"

		elif [ $builder_status = 2 ]; then
			## MINIFY OK ##s
			echo -e " \033[1m\033[34m\033m JS builder done: OK \033[0m"
			need_copy_js_files=1
		else
			echo echo -e " \033[1m\033[31m\033[5m UNKNOWN ERROR on JS building\033[0m"
			exit 0
		fi

		/home/mephius/configs/rc.conf.new.php/minify/js_css_builder.php -n $random.css --css
		builder_status=$?
		need_copy_css_files=0
		if [ $builder_status = 0 ]; then
			## MINIFY ERROR ##
			echo -e " \033[1m\033[31m\033[5m ERROR on CSS building\033[0m"
			exit 0
		elif [ $builder_status = 1 ]; then
			## MINIFY IS NOT NEED
			echo -e " \033[1m\033[34m\033m CSS minify is not needed \033[0m"

		elif [ $builder_status = 2 ]; then
			## MINIFY OK ##s
			echo -e " \033[1m\033[34m\033m CSS builder done: OK \033[0m"
			need_copy_css_files=1
		else
			echo echo -e " \033[1m\033[31m\033[5m UNKNOWN ERROR on CSS building\033[0m"
			exit 0
		fi
		# UPDATE WEB13(STATIC) AND WEB5
		 echo -e "\033[33m Updating web13 (static.izrukvruki.ru)...\033[0m"
		/usr/bin/ssh mephius@192.168.1.30 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web1...\033[0m"
		/usr/bin/ssh mephius@192.168.1.1 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"
		echo -e "\033[33m Updating web2...\033[0m"
		/usr/bin/ssh mephius@192.168.1.2 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"
		echo -e "\033[33m Updating web3...\033[0m"
		/usr/bin/ssh mephius@192.168.1.9 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		if [ $need_copy_js_files = 1 ]; then
			# Copy minified js file to static.izrukvruki.ru (web13)
			src_js_filename="/home/mephius/irr.ru/html/account/js/$random.js"
			dest_js_path="/usr/local/www/new.irr.ru/html/account/js"
			echo -e " \033[1m\033[34m\033m Copy minified JS $src_js_filename to WEB13(static) \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_js_filename mephius@192.168.1.30:$dest_js_path
			
			# Copy SSI for minified JS to WEB1, WEB2, WEB3
			src_js_ssi="/home/mephius/irr.ru/html/account/js/ssi/pseller.inc"
			dest_js_ssi_path="/usr/local/www/new.irr.ru/html/account/js/ssi"
			echo -e " \033[1m\033[34m\033m Copy SSI for minified JS $src_js_ssi to WEB1 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_js_ssi mephius@192.168.1.1:$dest_js_ssi_path
			echo -e " \033[1m\033[34m\033m Copy SSI for minified JS $src_js_ssi to WEB2 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_js_ssi mephius@192.168.1.2:$dest_js_ssi_path
			echo -e " \033[1m\033[34m\033m Copy SSI for minified JS $src_js_ssi to WEB3 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_js_ssi mephius@192.168.1.9:$dest_js_ssi_path
		fi
		
		if [ $need_copy_css_files = 1 ]; then
			# Copy minified css file to static.izrukvruki.ru (web13)
			src_css_filename="/home/mephius/irr.ru/html/account/css/$random.css"
			dest_css_path="/usr/local/www/new.irr.ru/html/account/css"
			echo -e " \033[1m\033[34m\033m Copy minified CSS $src_css_filename to WEB13(static) \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_css_filename mephius@192.168.1.30:$dest_css_path
			
			# Copy SSI for minified CSS to WEB5
			src_css_ssi="/home/mephius/irr.ru/html/account/css/ssi/pseller.inc"
			dest_css_ssi_path="/usr/local/www/new.irr.ru/html/account/css/ssi"
			echo -e " \033[1m\033[34m\033m Copy SSI for minified CSS $src_css_ssi to WEB1 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_css_ssi mephius@192.168.1.1:$dest_css_ssi_path
			echo -e " \033[1m\033[34m\033m Copy SSI for minified CSS $src_css_ssi to WEB2 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_css_ssi mephius@192.168.1.2:$dest_css_ssi_path
			echo -e " \033[1m\033[34m\033m Copy SSI for minified CSS $src_css_ssi to WEB3 \033[0m"
			/usr/bin/scp -P 22 -q -i  /home/mephius/.ssh/id_rsa $src_css_ssi mephius@192.168.1.9:$dest_css_ssi_path
		fi

		### START update static hosts
		echo -e "\033[33m Updating web14...\033[0m"
		/usr/bin/ssh mephius@192.168.1.107 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web15...\033[0m"
		/usr/bin/ssh mephius@192.168.1.183 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web16...\033[0m"
		/usr/bin/ssh mephius@192.168.1.108 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web17...\033[0m"
		/usr/bin/ssh mephius@192.168.1.179 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"
		### END static hosts

		### START update all others PHP hosts

		echo -e "\033[33m Updating web4...\033[0m"
		/usr/bin/ssh mephius@192.168.1.184 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web5...\033[0m"
		/usr/bin/ssh mephius@192.168.1.12 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web6...\033[0m"
		/usr/bin/ssh mephius@192.168.1.13 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web7...\033[0m"
		/usr/bin/ssh mephius@192.168.1.71 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web8...\033[0m"
		/usr/bin/ssh mephius@192.168.1.72 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web9...\033[0m"
		/usr/bin/ssh mephius@192.168.1.14 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web10...\033[0m"
		/usr/bin/ssh mephius@192.168.1.182 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web11...\033[0m"
		/usr/bin/ssh mephius@192.168.1.53 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web12...\033[0m"
		/usr/bin/ssh mephius@192.168.1.78 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web18...\033[0m"
		/usr/bin/ssh mephius@192.168.1.178 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web19...\033[0m"
		/usr/bin/ssh mephius@192.168.1.177 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating web20...\033[0m"
		/usr/bin/ssh mephius@192.168.1.176 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

		echo -e "\033[33m Updating webbo...\033[0m"
		/usr/bin/ssh mephius@192.168.1.164 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git pull; sudo /usr/local/etc/rc.d/php-fpm restart"

	;;
esac
