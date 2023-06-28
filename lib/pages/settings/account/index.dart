import 'package:file_picker/file_picker.dart';
import 'package:juai/entities/api_response.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:juai/common/store/user.dart';
import 'package:juai/common/utils/date.dart';
import 'package:juai/common/utils/file_utils.dart';
import 'package:juai/common/utils/qiniu_sdk.dart';
import 'package:juai/common/widgets/avatar.dart';
import 'package:juai/common/widgets/cell.dart';
import 'package:get/get.dart';
import 'package:juai/pages/settings/controler.dart';
import 'package:path/path.dart' as path;

/// HACK: 账户设置

class SettingsAccountPage extends StatefulWidget {
  const SettingsAccountPage({Key? key}) : super(key: key);

  @override
  State<SettingsAccountPage> createState() => _SettingsAccountPageState();
}

class _SettingsAccountPageState extends State<SettingsAccountPage> {
  final logic = Get.find<SettingsController>();
  final editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账号设置'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Cell(
                '头像',
                onTap: () {
                  FileUtils.openFile(
                    context,
                    (selectedFiles) {
                      var file = selectedFiles.first.file;
                      var key = UserStore.to.userInfo.value!.phone + "/" + DateTime.now().second.toString() + path.extension(file.path);
                      QiniuUtil.saveFile(file, FileType.image, key: key, isLoading: true, folder: "avatar", completeListener: (fileUrl, i) {
                        _toSet("Avatar", fileUrl, isBack: false);
                      });
                    },
                    maxAssets: 1,
                  );
                },
                right: avatar(avatarUrl: UserStore.to.userInfo.value!.avatar),
              ),
              Cell(
                '昵称',
                onTap: () => _confirmDiolog(UserStore.to.userInfo.value!.nickName, "NickName"),
                right: Text(UserStore.to.userInfo.value!.nickName),
              ),
              Cell(
                'JuAI号',
                right: Text(UserStore.to.userInfo.value!.userName),
                isMustRight: false,
              ),
              Cell(
                '性别',
                onTap: () => _confirmSexDiolog("性别", "Sex", UserStore.to.userInfo.value!.sex),
                right: Text(UserStore.to.userInfo.value!.sex ?? "男"),
              ),
              // Cell(
              //   '聚AI号',
              //   onTap: () => _confirmDiolog(UserStore.to.userInfo.value!.userName, "UserName"),
              //   right: Text(UserStore.to.userInfo.value!.userName),
              // ),
              Cell(
                '手机号',
                onTap: () => Get.toNamed(Routes.settingsUpdatePhone),
                right: Text(UserStore.to.userInfo.value!.phone),
              ),
              Cell('修改密码', onTap: () => Get.toNamed(Routes.settingsUpdatePwd)),
              Cell(
                '个性签名',
                onTap: () => _confirmDiolog(UserStore.to.userInfo.value!.remark, "Remark"),
                right: Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text(
                    UserStore.to.userInfo.value!.remark ?? "什么也没有",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Cell('更换绑定手机号', onTap: () => Get.toNamed(Routes.settingsUpdatePhone)),
              // Cell('注销账号', onTap: () => Get.toNamed(Routes.settingsLoginout)),
            ],
          ),
        ),
      ),
    );
  }

  _confirmDiolog(titile, name) {
    Get.bottomSheet(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Wrap(
          alignment: WrapAlignment.end,
          children: <Widget>[
            TextField(
              controller: editController,
              decoration: InputDecoration(hintText: titile),
            ),
            TextButton(
              child: const Text("确定"),
              onPressed: () {
                var text = editController.text.trim();
                if (text.isNotEmpty) {
                  _toSet(name, text);
                }
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  _confirmSexDiolog(titile, name, value) {
    Get.bottomSheet(
      Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.boy_sharp),
            title: const Text('男'),
            trailing: Checkbox(
                value: value == "男",
                onChanged: (val) {
                  _toSet(name, "男");
                }),
            onTap: () => _toSet(name, "男"),
          ),
          ListTile(
            leading: const Icon(Icons.girl_sharp),
            title: const Text('女'),
            trailing: Checkbox(
                value: value == "女",
                onChanged: (val) {
                  _toSet(name, "女");
                }),
            onTap: () => _toSet(name, "女"),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  _toSet(name, vlaue, {bool isBack = true}) {
    logic.state.editUser = Map.from({});
    logic.state.editUser.addIf(vlaue.toString().isNotEmpty, name, vlaue);
    UserAPI.userUpdate(logic.state.editUser).then((value) async {
      await UserStore.to.resetUserInfo(logic.state.editUser);
      setState(() {
        if (value.isOk && isBack) Get.back();
        UserStore.to.userInfo.refresh();
        logic.state.nickName.value = UserStore.to.userInfo.value!.nickName;
        logic.state.avatar.value = UserStore.to.userInfo.value!.avatar;
      });
    });
  }
}
