INSERT INTO cf_role(roleName_m, enabled_c, crtOn_dt, crtBy_m) VALUES('ROLE_SUP', 'Y', NOW(), 'System');
INSERT INTO cf_resource(resType_x, resPath_x, resDesc_x, enabled_c, crtOn_dt, crtBy_m) VALUES('HOME', '/index', 'Home Page', 'Y', NOW(), 'System');
INSERT INTO cf_role2res(roleId_n, resId_n, crtOn_dt, crtBy_m) VALUES(1, 1, NOW(), 'System');
INSERT INTO cf_user(username_m, password_x, enabled_c, crtOn_dt, crtBy_m) VALUES('Admin', '$2a$11$oGpHm0cUXvtUOupwtlgL8./6EXUa3sOTuycMAc6DdiB0tkl7l4ula', 'Y', NOW(), 'System');
INSERT INTO cf_user2role(userId_n, roleId_n, crtOn_dt, crtBy_m) VALUES(1, 1, NOW(), 'System');