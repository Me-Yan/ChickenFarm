INSERT INTO cf_role(roleName_m, enabled_c, crtOn_dt, crtBy_m) VALUES('ROLE_SUP', 'Y', NOW(), 'System');
INSERT INTO cf_resource(resType_x, resPath_x, resDesc_x, enabled_c, crtOn_dt, crtBy_m) VALUES('HOME', '/index', 'Home Page', 'Y', NOW(), 'System');
INSERT INTO cf_role2res(roleId_n, resId_n, crtOn_dt, crtBy_m) VALUES(1, 1, NOW(), 'System');
INSERT INTO cf_user(username_m, password_x, enabled_c, crtOn_dt, crtBy_m) VALUES('Admin', '$2a$11$oGpHm0cUXvtUOupwtlgL8./6EXUa3sOTuycMAc6DdiB0tkl7l4ula', 'Y', NOW(), 'System');
INSERT INTO cf_user2role(userId_n, roleId_n, crtOn_dt, crtBy_m) VALUES(1, 1, NOW(), 'System');



INSERT INTO cf_classify(classifyId_n, classifyName_m, classifyClass_x, seq_c, status_x, crtOn_dt, crtBy_m) VALUES(1, '菜单管理', 'fa fa-th-list', 50, 'Stabled', NOW(), 'System');
INSERT INTO cf_category(categoryId_n, categoryName_m, path_x, classifyId_n, seq_c, active_c, crtOn_dt, crtBy_m) VALUES(1, '一级菜单', 'classify/list', 1, 1, 'A', NOW(), 'System');
INSERT INTO cf_category(categoryId_n, categoryName_m, path_x, classifyId_n, seq_c, active_c, crtOn_dt, crtBy_m) VALUES(2, '二级菜单', 'category/list', 1, 2, 'A', NOW(), 'System');

INSERT INTO cf_code(codeId_n, type_x, name_x, value_x, desc_x, active_c, crtBy_m, crtOn_dt) VALUES(1, 'recordType', 'weight', '重量', '重量', 'A', 'System', NOW());
INSERT INTO cf_code(codeId_n, type_x, name_x, value_x, desc_x, active_c, crtBy_m, crtOn_dt) VALUES(2, 'recordType', 'price', '单价', '单价', 'A', 'System', NOW());
INSERT INTO cf_code(codeId_n, type_x, name_x, value_x, desc_x, active_c, crtBy_m, crtOn_dt) VALUES(3, 'recordType', 'amount', '金额', '金额', 'A', 'System', NOW());
INSERT INTO cf_code(codeId_n, type_x, name_x, value_x, desc_x, active_c, crtBy_m, crtOn_dt) VALUES(4, 'recordType', 'count', '数量', '数量', 'A', 'System', NOW());