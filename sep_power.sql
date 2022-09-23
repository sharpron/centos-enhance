create role sys_role;
create role safe_role;
create role audit_role;
grant create,drop,alter on *.* to sys_role;
grant create user on *.* to safe_role; 
grant AUDIT_ADMIN on *.* to audit_role;

create user sys@'%' identified by 'cB^WxysF6n444klf';
grant sys_role to sys@'%';

create user safe@'%' identified by 'cB^WxysF6n444klf';
grant safe_role to safe@'%';

create user audit@'%' identified by 'cB^WxysF6n444klf';
grant audit_role to safe@'%';