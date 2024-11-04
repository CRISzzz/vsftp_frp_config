# Set to passive mode
echo 'pasv_enable=YES'>>/etc/vsftpd.conf 
# Set the maximum random port for passive mode to 6003
echo 'pasv_max_port=6003'>>/etc/vsftpd.conf
# Set the minimum random port for passive mode to 6003
echo 'pasv_min_port=6003'>>/etc/vsftpd.conf
# Since this is achieved through forwarding, the vsftp on frpc should naturally access the frps IP instead of the FTP client's IP
echo 'pasv_address=Server IP'>>/etc/vsftpd.conf
echo ' [common]' >/etc/frpc.ini
echo ' server_addr = Server IP' >/etc/frpc.ini
echo ' server_port = 7000' >/etc/frpc.ini
echo ' token = Your token' >/etc/frpc.ini
echo ' ' >/etc/frpc.ini
echo ' [ftp1]' >/etc/frpc.ini
echo ' type=tcp' >/etc/frpc.ini
echo ' local_ip=127.0.0.1' >/etc/frpc.ini
echo ' local_port=21' >/etc/frpc.ini
# Forward frps port 6002 to frpc's port 21
echo ' remote_port=6002' >/etc/frpc.ini
echo ' ' >/etc/frpc.ini
echo ' [ftp2]' >/etc/frpc.ini
echo ' type=tcp' >/etc/frpc.ini
echo ' local_ip=127.0.0.1' >/etc/frpc.ini
echo ' local_port=6003' >/etc/frpc.ini
# Forward frps port 6003 to frpc's port 6003
echo ' remote_port=6003' >/etc/frpc.ini
