# Centos三权分立

function create_account() {
  account=$1
  # 创建同名组
  groupadd $account
  
  # 创建用户
  useradd $account -g $account
  if [ $? -ne 0 ]; then
    return 2
  fi
  # 生成随机密码
  random_pass=$(openssl rand -base64 12)
  echo $random_pass | passwd --stdin $account
  echo "创建账号成功: $account:$random_pass"
  # 持久化账号密码
  echo "$account:$random_pass" >> pass.txt
}


echo '------------------添加三权分立账号------------------'
# 创建安全管理员
create_account safe
# 创建审计员
create_account audit
# 创建系统管理员
create_account sys

echo '禁用ROOT账号直接登录'
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd